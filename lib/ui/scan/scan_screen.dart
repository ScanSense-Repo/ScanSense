import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/scan/result_screen.dart';
import 'package:scan_sense/utils/helper.dart';

class ScanScreen extends StatefulWidget {
  static const String routeName = '/scan-screen';

  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            // expandedHeight: 100.0,
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
                      "Arahkan kamera ke KTP yang ingin di verifikasi. Usahakan gambar terlihat jelas !!",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: grayColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CameraPreview(controller),
                      ),
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
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width)),
                      child: Text(
                        "Verifikasi",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigation.toNamed(routeName: ResultScreen.routeName),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side:
                                const BorderSide(color: primaryColor, width: 1),
                          ),
                          backgroundColor: backgroundColor,
                          elevation: 0,
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width)),
                      child: Text(
                        "Unggah Gambar",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
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

class MyImageView extends StatelessWidget {
  const MyImageView({Key? key, required this.imageBytes}) : super(key: key);
  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: SizedBox(
        width: double.infinity,
        child: Image.memory(imageBytes),
      ),
    );
  }
}
