import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/providers/company/rank_provider.dart';
import 'package:scan_sense/ui/login/login_screen.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:scan_sense/widgets/logout-pop.dart';

class DetailCompanyScreen extends ConsumerStatefulWidget {
  static const String routeName = '/detail-company-home-screen';
  const DetailCompanyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailCompanyScreenState();
}

class _DetailCompanyScreenState extends ConsumerState<DetailCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final args = ModalRoute.of(context)?.settings.arguments as String;

    List<String> bidangs = [
      "Web Developer",
      "Mobile Developer",
      "UI/UX",
      "Marketing",
      "Data Analyst"
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
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
                      'assets/illustrations/profile.png',
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
                IconButton(
                    onPressed: () async {
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
                    icon: const Icon(Icons.logout)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Perangkingan Bidang $args",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: grayColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final rank = ref.watch(rankProvider(args));

                  return rank.when(data: (data) {
                    data.sort((a, b) => b.value.compareTo(a.value));

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 3,
                            shadowColor: inputBackground,
                            color: whiteColor,
                            surfaceTintColor: whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("${index + 1}"),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        data[index].value.toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: grayColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }, error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        error.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: grayColor,
                        ),
                      ),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
