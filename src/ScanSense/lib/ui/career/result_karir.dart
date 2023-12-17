import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';

class ResultKarirScreen extends StatefulWidget {
  static const String routeName = '/result-karir-screen';

  const ResultKarirScreen({Key? key}) : super(key: key);

  @override
  _ResultKarirScreenState createState() => _ResultKarirScreenState();
}

class _ResultKarirScreenState extends State<ResultKarirScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();

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
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hasil Perangkingan",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Sesuaikan tinggi sesuai kebutuhan
            // Kolom Pencarian
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.search, color: Colors.black, size: 40),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8),
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Menambahkan Row dengan nomer, CircleAvatar, dan nama
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "1.", // Ganti dengan nomer yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile/img1.png'),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Dyrooth", // Ganti dengan nama yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "2.", // Ganti dengan nomer yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile/img2.png'),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Odette", // Ganti dengan nama yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "3.", // Ganti dengan nomer yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile/img3.png'),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Rafaela", // Ganti dengan nama yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "4.", // Ganti dengan nomer yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile/img4.png'),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Minotaur", // Ganti dengan nama yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "5.", // Ganti dengan nomer yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile/img5.png'),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Helcurt", // Ganti dengan nama yang sesuai
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
