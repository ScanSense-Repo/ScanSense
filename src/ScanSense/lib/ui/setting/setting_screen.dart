import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/ui/about us/about_us.dart';
import 'package:scan_sense/ui/login/login_screen.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:scan_sense/widgets/logout-pop.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';


class SettingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/setting-screen';

  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      key: _scaffoldKey,
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow
                    spreadRadius: 1, // Menentukan seberapa jauh shadow menyebar
                    blurRadius: 5, // Menentukan tingkat blur shadow
                    offset: Offset(
                        0, 3), // Mengatur posisi shadow (horizontal, vertical)
                  ),
                ],
              ),
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
                ),
              ),
            ),
          ),
          //const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow
                    spreadRadius: 1, // Menentukan seberapa jauh shadow menyebar
                    blurRadius: 5, // Menentukan tingkat blur shadow
                    offset: Offset(
                        0, 3), // Mengatur posisi shadow (horizontal, vertical)
                  ),
                ],
              ),
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
                ),
              ),
            ),
          ),

          //const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow
                    spreadRadius: 1, // Menentukan seberapa jauh shadow menyebar
                    blurRadius: 5, // Menentukan tingkat blur shadow
                    offset: Offset(
                        0, 1), // Mengatur posisi shadow (horizontal, vertical)
                  ),
                ],
              ),
              child: OutlinedButton.icon(
                onPressed: () async {
                  // Tampilkan popup logout
                  showDialog(
                    context: context,
                    builder: (context) => LogoutPopup(
                      onYes: () async {
                        // Lakukan logout
                        await auth.logout();

                        // Hapus semua rute dan pindah ke halaman login
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routeName,
                          (route) =>
                              false, // Hapus semua rute kecuali halaman login
                        );

                        // Tampilkan notifikasi berhasil logout
                        AnimatedSnackBar.material(
                          "Anda berhasil logout.",
                          type: AnimatedSnackBarType.error,
                          duration: const Duration(seconds: 2),
                        ).show(context);
                      },
                      onNo: () {
                        // Batalkan logout
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
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
                  side: const BorderSide(color: primaryColor, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
