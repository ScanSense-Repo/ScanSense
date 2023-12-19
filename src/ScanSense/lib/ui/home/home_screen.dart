import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/ui/history/history_screen.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigation.toNamed(routeName: ProfileScreen.routeName);
                  },
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile/img1.png',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat datang kembali",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: grayColor,
                        ),
                      ),
                      Text(
                        auth.auth?.user.name ?? "John Doe",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Add new widget for notification
                const SizedBox(
                  width: 48,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Riwayat Validasi",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: grayColor,
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigation.toNamed(routeName: HistoryScreen.routeName),
                  child: Text(
                    "Tampilkan Semua",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Card(
                  elevation: 3,
                  shadowColor: inputBackground,
                  color: whiteColor,
                  surfaceTintColor: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3576447103920003",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Lukas Valentino",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: grayColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: successLightColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Valid",
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  elevation: 3,
                  shadowColor: inputBackground,
                  color: whiteColor,
                  surfaceTintColor: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3576447103920003",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Lukas Valentino",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: grayColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: dangerLightColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Tidak Valid",
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
