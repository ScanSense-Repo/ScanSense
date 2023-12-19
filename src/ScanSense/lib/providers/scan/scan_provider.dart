import 'dart:io';
import 'dart:typed_data';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/model/ktp.dart';
import 'package:scan_sense/domain/repositories/verify_repository.dart';

class ScanNotifier extends ChangeNotifier {
  String? _imagePath;
  String? get imagePath => _imagePath;

  img.Image? _image;
  img.Image? get image => _image;

  Uint8List? _imageUint;
  Uint8List? get imageUint => _imageUint;

  File? _imageFile;
  File? get imageFile => _imageFile;

  Failure? _failure;
  bool _isLoading = false;

  Failure? get failure => _failure;
  bool get isLoading => _isLoading;

  Ktp? _ktp;
  Ktp? get ktp => _ktp;

  final VerifyRepository _verifyRepository;

  ScanNotifier(this._verifyRepository);

  Future<bool> verify({required String name, required String nik}) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    if (_imageFile == null) {
      return false;
    }

    final response = await _verifyRepository.verify(name, nik);

    return response.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();

      return false;
    }, (right) {
      _isLoading = false;
      notifyListeners();

      return right;
    });
  }

  Future<bool> saveResult({required Ktp ktp, required bool isValid}) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    if (_imageFile == null) {
      return false;
    }

    final response =
        await _verifyRepository.saveResult(_imageFile!, ktp, isValid);

    return response.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();

      return false;
    }, (right) {
      _isLoading = false;
      notifyListeners();

      return true;
    });
  }

  Future<void> getImageFromCamera() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have not permission to camera
      return;
    }

    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    bool success = false;

    try {
      //Make sure to await the call to detectEdge.
      success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      print("success: $success");
    } catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    if (success) {
      _imagePath = imagePath;
      final imgBytes = await File(_imagePath!).readAsBytes();
      final cmd = img.Command()
        ..decodeImage(imgBytes)
        ..grayscale();

      await cmd.executeThread();
      _image = cmd.outputImage;

      final cmdEncode = img.Command()
        ..image(_image!)
        ..encodePng();
      await cmdEncode.executeThread();
      _imageUint = cmdEncode.outputBytes;

      _imageFile = File(_imagePath!);

      notifyListeners();
    }
  }

  Future<void> getImageFromGallery() async {
    // Generate filepath for saving
    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    bool success = false;
    try {
      //Make sure to await the call to detectEdgeFromGallery.
      success = await EdgeDetection.detectEdgeFromGallery(
        imagePath,
        androidCropTitle: 'Crop', // use custom localizations for android
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      print("success: $success");
    } catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    if (success) {
      _imagePath = imagePath;
      final imgBytes = await File(_imagePath!).readAsBytes();
      final cmd = img.Command()
        ..decodeImage(imgBytes)
        ..grayscale();

      await cmd.executeThread();
      _image = cmd.outputImage;

      final cmdEncode = img.Command()
        ..image(_image!)
        ..encodePng();
      await cmdEncode.executeThread();
      _imageUint = cmdEncode.outputBytes;

      _imageFile = File(_imagePath!);

      notifyListeners();
    }
  }

  void clearImage() {
    _imagePath = null;
    _image = null;
    notifyListeners();
  }

  Future<bool> ocrKtp(File ktp) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    final response = await _verifyRepository.ocr(ktp);

    return response.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();

      return false;
    }, (right) {
      _isLoading = false;
      _ktp = right;
      notifyListeners();

      return true;
    });
  }
}

final scanProvider = ChangeNotifierProvider<ScanNotifier>((ref) {
  final verifyRepository = ref.read(verifyRepositoryProvider);

  return ScanNotifier(verifyRepository);
});
