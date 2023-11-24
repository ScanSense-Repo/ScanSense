import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TestScreen extends StatefulWidget {
  static String routeName = '/test-screen';
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String? _imagePath;
  img.Image? _image;

  @override
  void initState() {
    super.initState();
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
    if (!mounted) return;

    setState(() {
      if (success) {
        _imagePath = imagePath;
        _image = img
            .grayscale(img.decodeImage(File(_imagePath!).readAsBytesSync())!);
      }
    });
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
    if (!mounted) return;

    setState(() {
      if (success) {
        _imagePath = imagePath;
        _image = img
            .grayscale(img.decodeImage(File(_imagePath!).readAsBytesSync())!);
      }
    });
  }

  Future<void> saveImage(BuildContext context) async {
    if (_image != null) {
      try {
        // Encode the image to bytes
        List<int> bytes = img.encodePng(_image!);

        // Save the image to the gallery
        await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image saved to gallery successfully'),
          ),
        );
      } catch (e) {
        print('Error saving image to gallery: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save image to gallery'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image to save'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: getImageFromCamera,
                  child: const Text('Scan'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: getImageFromGallery,
                  child: const Text('Upload'),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Cropped image path:'),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                child: Text(
                  _imagePath.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Visibility(
                visible: _imagePath != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(_imagePath ?? ''),
                  ),
                ),
              ),
              Visibility(
                visible: _image != null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _image != null
                      ? Image.memory(Uint8List.fromList(img.encodePng(_image!)))
                      : const Text('Converted Image'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => saveImage(context),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
