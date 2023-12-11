import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/scan/scan_provider.dart';
import 'package:scan_sense/ui/scan/result_screen.dart';

class ScanScreen extends ConsumerStatefulWidget {
  static const String routeName = '/scan-screen';

  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    final scan = ref.watch(scanProvider);

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
                        child: scan.image == null
                            ? Image.asset(
                                'assets/illustrations/ktp.png',
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                Uint8List.fromList(
                                  scan.imageUint!,
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
                            onPressed: () => scan.getImageFromCamera(),
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
                            onPressed: () => scan.getImageFromGallery(),
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
