import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/ui/password/forgot_password.dart';
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
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName);
                        },
                        child: Text(
                          "Lupa kata sandi?",
                          style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: 13,
                              decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
              auth.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (auth.isLoading) return;

                              final username = cUsername.text;
                              final password = cPassword.text;

                              if (username.isEmpty || password.isEmpty) {
                                // Jika username atau password kosong
                                if (mounted) {
                                  AnimatedSnackBar.material(
                                    "Silahkan masukkan username dan password",
                                    type: AnimatedSnackBarType.warning,
                                    duration: const Duration(seconds: 2),
                                  ).show(context);
                                }
                                return;
                              }

                              auth.setLoading(true);
                              final login =
                                  await auth.login(username, password);
                              auth.setLoading(false);

                              if (login) {
                                // Jika login berhasil
                                if (mounted) {
                                  AnimatedSnackBar.material(
                                    "Selamat Datang",
                                    type: AnimatedSnackBarType.success,
                                    duration: const Duration(seconds: 2),
                                  ).show(context);
                                  Navigation.toReplacementNamed(
                                      routeName: LayoutScreen.routeName);
                                }
                              } else {
                                // Jika login gagal
                                if (mounted) {
                                  AnimatedSnackBar.material(
                                    "Username dan Password tidak sesuai, Silahkan mencoba kembali",
                                    type: AnimatedSnackBarType.warning,
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
                              Navigation.toNamed(
                                  routeName: RegisterScreen.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: primaryColor, width: 1),
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
