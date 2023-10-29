import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/home/home_screen.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/register/register_screen.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    "Silahkan login dengan memasukkan nama sekolah, nis, dan password kamu.",
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
                      "Lupa kata sandi ?",
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
                      onPressed: () => Navigation.replaceNamed(
                          routeName: LayoutScreen.routeName),
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
