import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/scan/result_screen.dart';

class ScanScreen extends StatefulWidget {
  static const String routeName = '/scan-screen';

  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Verifikasi KTP",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: blackColor),
              ),
            ),
            primary: true,
            backgroundColor: backgroundColor,
            surfaceTintColor: backgroundColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "Ambil gambar KTP Anda dengan benar agar dapat diverifikasi oleh sistem kami.",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: grayColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: _imagePath == null
                            ? Image.asset(
                                'assets/illustrations/ktp.png',
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                Uint8List.fromList(
                                  img.encodePng(_image!),
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: getImageFromCamera,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: primaryColor, width: 1),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Kamera",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: getImageFromGallery,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: primaryColor, width: 1),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Unggah Gambar",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigation.toNamed(routeName: ResultScreen.routeName),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: primaryColor,
                        fixedSize:
                            Size.fromWidth(MediaQuery.of(context).size.width),
                      ),
                      child: Text(
                        "Verifikasi",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
