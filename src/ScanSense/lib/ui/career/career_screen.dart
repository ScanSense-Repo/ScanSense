import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/career/karir_screen.dart';

class CareerScreen extends ConsumerStatefulWidget {
  static const String routeName = '/career-screen';

  const CareerScreen({Key? key}) : super(key: key);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends ConsumerState<CareerScreen> {
  bool isButtonAPressed = false;
  bool isButtonBPressed = false;
  bool isButtonCPressed = false;
  bool isButtonDPressed = false;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Karir",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: _buildPage(
              "Selamat Datang",
              "Karir Politeknik Negeri Malang",
              'assets/illustrations/career_image.png',
              additionalText1: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              content1:
                  "Selamat datang di peluang karir kami! Kami tertarik untuk mengenalmu lebih baik.",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    String title,
    String additionalText,
    String imagePath, {
    TextStyle? additionalText1,
    String content1 = "",
  }) {
    TextStyle currentAdditionalText;
    String currentContent;

    if (_currentPage == 0) {
      currentAdditionalText = additionalText1 ??
          TextStyle(); // Use the provided style or an empty style
      currentContent = content1;
    } else {
      currentAdditionalText =
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
      currentContent =
          ''; // Content for page 3 is a widget, set an empty string
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  additionalText,
                  style: currentAdditionalText,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 16),
                  Image.asset(
                    imagePath,
                    height: 250,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  currentContent,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: whiteColor,
                elevation: 3, // Tambahkan nilai elevation sesuai keinginan Anda
              ),
              onPressed: () {
                Navigation.toNamed(routeName: KarirScreen.routeName);
              },
              child: Text(
                "Mulai",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:
                      primaryColor, // Ganti dengan warna teks yang diinginkan
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
