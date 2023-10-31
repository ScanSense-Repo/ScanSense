import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/setting-screen';

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Setting",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
          ),
        ),
      ),
      body: Column(
        children: [
          // Logo
          Container(
            margin: EdgeInsets.all(20),
            child: Image.asset('assets/illustrations/logo-ocr-rev.png'),
          ),

          // Button
          Container(
            width: 350,
            height: 60,
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () =>
                  Navigation.toNamed(routeName: ProfileScreen.routeName),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              child: Text(
                "Ubah Profil",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 60,
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () =>
                  Navigation.toNamed(routeName: ProfileScreen.routeName),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
              child: Text(
                "Tentang Kami",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 350,
            height: 60,
            margin: EdgeInsets.only(bottom: 20),
            child: OutlinedButton(
              onPressed: () => SystemNavigator.pop(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: whiteColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                side: BorderSide(color: primaryColor, width: 2),
              ),
              child: Text(
                "Logout",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
