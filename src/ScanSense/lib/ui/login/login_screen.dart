import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/register/register_screen.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang Kembali",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                  Text(
                    "Silahkan login dengan memasukkan username dan password kamu.",
                    style: GoogleFonts.poppins(fontSize: 13, color: grayColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomInput(
                    controller: cUsername,
                    hint: "Username",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomInput(
                    controller: cPassword,
                    hint: "Kata Sandi",
                    isObscure: true,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lupa kata sandi?",
                      style: GoogleFonts.poppins(
                          color: primaryColor, fontSize: 13),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (auth.isLoading) return;

                        final login =
                            await auth.login(cUsername.text, cPassword.text);
                        if (login) {
                          if (mounted) {
                            AnimatedSnackBar.material(
                              "Selamat Datang",
                              type: AnimatedSnackBarType.success,
                              duration: const Duration(seconds: 2),
                            ).show(context);
                            Navigation.toNamed(
                                routeName: LayoutScreen.routeName);
                          }
                        } else {
                          // Show a pop-up if login fails
                          if (mounted) {
                            AnimatedSnackBar.material(
                              "Username dan Password tidak sesuai, coba ulangi kembali",
                              type: AnimatedSnackBarType.error,
                              duration: const Duration(seconds: 2),
                            ).show(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        "Masuk",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigation.toNamed(routeName: RegisterScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: primaryColor, width: 1),
                        ),
                        backgroundColor: backgroundColor,
                        elevation: 0,
                      ),
                      child: Text(
                        "Daftar",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
