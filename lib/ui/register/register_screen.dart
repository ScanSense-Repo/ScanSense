import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => Navigation.back(),
                          icon: Icon(Icons.arrow_back_rounded)),
                      Text(
                        "Halaman Daftar",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: blackColor),
                      ),
                    ],
                  ),
                  Text(
                    "Silahkan mendaftarkan akun anda agar bisa mengakses aplikasi kami.",
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
                    controller: cUsername,
                    hint: "E-mail",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomInput(
                    controller: cUsername,
                    hint: "No Telepon",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomInput(
                    controller: cPassword,
                    hint: "Kata Sandi",
                    isObscure: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomInput(
                    controller: cPassword,
                    hint: "Konfirmasi Kata Sandi",
                    isObscure: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
