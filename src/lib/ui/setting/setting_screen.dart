import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:scan_sense/ui/about us/about_us.dart';

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
            "Pengaturan",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          // Logo
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset('assets/illustrations/logo-ocr-rev.png'),
          ),

          // Button
          Container(
            width: 350,
            height: 60,
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigation.toNamed(routeName: ProfileScreen.routeName),
              icon: const Icon(CupertinoIcons.pencil_outline,
                  color: Colors.white),
              label: Text(
                "Ubah Profil",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 60,
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigation.toNamed(routeName: AboutUsScreen.routeName),
              icon: const Icon(Icons.info_outline, color: Colors.white),
              label: Text(
                "Tentang Kami",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: primaryColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 350,
            height: 60,
            margin: const EdgeInsets.only(bottom: 20),
            child: OutlinedButton.icon(
              onPressed: () => SystemNavigator.pop(),
              icon: const Icon(Icons.logout, color: primaryColor),
              label: Text(
                "Log out",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: whiteColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                side: const BorderSide(color: primaryColor, width: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
