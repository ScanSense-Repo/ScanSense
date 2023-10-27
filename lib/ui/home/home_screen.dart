// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/history/detail_history.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 60,
              left: 20,
              child: CircleAvatar(
                radius: 40, // Ubah radius sesuai kebutuhan
                // backgroundImage: AssetImage('assets/profile_image.jpg'), // Ganti dengan path gambar profil
              ),
            ),
            Positioned(
              top: 75,
              left: 110, // Jarak horizontal antara gambar dan teks
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selamat Datang Kembali',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350],
                      )),
                  Text('Rony',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              child: Row(
                children: [
                  Text('Riwayat Validasi',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      )),
                  // berikan jarak antara teks
                  SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigation.toNamed(routeName: HistoryScreen.routeName),
                    child: Text('Tampilkan Semua',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.blue,
                        )),
                  ),
                  // Text(
                  //   'Tampilkan Semua',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.blue,
                  //   ),
                  // ),
                ],
              ),
            ),
            Positioned(
              top: 220,
              left: 20,
              right: 20,
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
                      child: Text('3576447103910003',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: Text('Mochamad Zaky Zamroni',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 230,
              right: 30,
              child: Card(
                color: Color.fromARGB(107, 3, 241, 11),
                child: Container(
                  // margin top
                  width: 60,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Valid',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 310,
              left: 20,
              right: 20,
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
                      child: Text(
                        '3576447103910003',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: Text(
                        'Mochamad Zaky Zamroni',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 320,
              right: 30,
              child: Card(
                color: Color.fromARGB(107, 241, 15, 3),
                child: Container(
                  // margin top
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Tidak Valid',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
