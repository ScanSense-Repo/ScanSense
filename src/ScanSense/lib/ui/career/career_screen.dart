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
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 1",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Bagikan pengalaman kerjamu yang penuh warna. Tandai kotak yang sesuai dan beri kami wawasan tentang perjalanan profesionalmu.",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 2",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Selanjutnya, mari kenali keahlianmu dengan memberikan nilai pada setiap skill yang kamu miliki.",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent2(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 3",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Waktunya memilih lokasi impian! Pilih kotak yang mencerminkan tempat dimana semangatmu akan berkembang.",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent3(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 4",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Pernah aktif di organisasi? Ceritakan pengalaman organisasimu yang inspiratif. Centang kotak yang sesuai dan beri kita wawasan lebih lanjut.",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent4(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 5",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Bagian umur, memberikan kita gambaran tentang semangat muda yang kamu bawa. Pilih kotak yang sesuai dan tetap semangat!",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent5(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Pertanyaan 6",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                Text(
                  "Terakhir, tetapi tak kalah penting, beri kami gambaran tentang pencapaian akademismu. Pilih kotak yang mencerminkan IPKmu. ",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Pilihlah Jawaban Dibawah Ini",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 40), // Sesuaikan nilai sesuai kebutuhan
                _buildQuestionContent6(),
              ],
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
    String additionalText3 = "",
    Widget? content3,
    TextStyle? titleStyle3,
    String additionalText4 = "",
    Widget? content4,
    TextStyle? titleStyle4,
    String additionalText5 = "",
    Widget? content5,
    TextStyle? titleStyle5,
    String additionalText6 = "",
    Widget? content6,
    TextStyle? titleStyle6,
    String additionalText7 = "",
    Widget? content7,
    TextStyle? titleStyle7,
    String additionalText8 = "",
    Widget? content8,
    TextStyle? titleStyle8,
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '1 tahun',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '3 tahun', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '5 tahun', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '7 tahun', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent2() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '> 3',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '3-5', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '6-8', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '< 8', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent3() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Surabaya',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Banyuwangi', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Gresik', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Malang', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent4() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Tidak pernah',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Pernah sebagai anggota', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Pernah sebagai pengurus', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Pernah sebagai ketua', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent5() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '> 25 tahun',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '25 - 30 tahun', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '31 - 35 tahun', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '< 35 tahun', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent6() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "A" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '> 3.0',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Jarak antara baris
          // Lakukan hal yang sama untuk tombol "B", "C", dan "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "B" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'B',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '3.0 - 3.5', // Teks untuk "B"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "C"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "C" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '3.6 - 3.8', // Teks untuk "C"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Lakukan hal yang sama untuk tombol "D"
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diinginkan saat tombol "D" ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'D',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '< 3.8', // Teks untuk "D"
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
