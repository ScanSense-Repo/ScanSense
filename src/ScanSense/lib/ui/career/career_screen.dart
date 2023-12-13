import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';

class CareerScreen extends ConsumerStatefulWidget {
  static const String routeName = '/career-screen';

  const CareerScreen({Key? key}) : super(key: key);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends ConsumerState<CareerScreen> {
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
          _buildPage(
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
          _buildPage(
            "Pilih Pekerjaan Impian",
            "",
            "",
            // No image for the second page
            content2: "Isi halaman 2 yang berbeda",
            titleStyle2: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildPage(
            "Pertanyaan 1",
            "Bagikan pengalaman kerjamu yang penuh warna. Tandai kotak yang sesuai dan beri kami wawasan tentang perjalanan profesionalmu.",
            '',

            content3: _buildQuestionContent(), // Widget for question content
            titleStyle3: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
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
    String additionalText2 = "",
    String content2 = "",
    TextStyle? titleStyle2,
    Widget? content3,
    TextStyle? titleStyle3,
  }) {
    TextStyle currentAdditionalText;
    String currentContent;

    if (_currentPage == 0) {
      currentAdditionalText = additionalText1 ??
          TextStyle(); // Use the provided style or an empty style
      currentContent = content1;
    } else if (_currentPage == 1) {
      currentAdditionalText =
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
      currentContent = content2;
    } else {
      currentAdditionalText =
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
      currentContent =
          ''; // Content for page 3 is a widget, set an empty string
    }

    TextStyle currentTitleStyle;
    if (_currentPage == 1) {
      currentTitleStyle = titleStyle2 ?? TextStyle();
    } else if (_currentPage == 2) {
      currentTitleStyle = titleStyle3 ?? TextStyle();
    } else {
      currentTitleStyle = GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: blackColor,
      );
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
                style: currentTitleStyle,
              ),
              if (additionalText.isNotEmpty)
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
              if (_currentPage == 0)
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
              if (_currentPage == 1)
                _buildButtonGrid()
              else
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
              onPressed: () {
                // Tambahkan navigasi ke halaman selanjutnya
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.pushNamed(context, '/pertanyaan-screen');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: primaryColor, width: 1),
                ),
                backgroundColor: backgroundColor,
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _currentPage < 2 ? "Next" : "Next",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: primaryColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonGrid() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("IT Programmer"),
            _buildButton("Product Manager"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("UI/UX Designer"),
            _buildButton("Social Media"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("Marketing"),
            _buildButton("HRD"),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0, right: 8.0, left: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your button logic here
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(175, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: primaryColor, width: 1),
          ),
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    return _currentPage == 2
        ? GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          )
        : GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: blackColor,
          );
  }

  Widget _buildQuestionContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxListTile(
          title: Text("Option A"),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text("Option B"),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text("Option C"),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text("Option D"),
          controlAffinity: ListTileControlAffinity.leading,
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
