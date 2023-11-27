import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';

class AboutUsScreen extends StatefulWidget {
  static const String routeName = '/about-screen';

  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Tentang Kami",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Logo
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset('assets/illustrations/logo-ocr-rev.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "ScanSense adalah aplikasi verifikasi identitas pengguna dengan kemampuan Optical Character Recognition (OCR) yang berintegrasi dengan database Politeknik Negeri Malang.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Contact information
                Text(
                  "Hubungi Kami :",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Text(
                  "scansense@gmail.com",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                Text(
                  "Jalan Soekarno Hatta, Malang, Indonesia",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Privacy policy button
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the privacy policy page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        child: const Text("Kebijakan Privasi",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Help center button
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the privacy policy page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        child: const Text("Pusat Bantuan",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Version",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                    ),
                    Text(
                      "4.1.5",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
