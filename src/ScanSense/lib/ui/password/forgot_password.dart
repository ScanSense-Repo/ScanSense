import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot-password';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Kata Sandi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Masukkan alamat email Anda untuk mereset kata sandi',
              style: GoogleFonts.poppins(fontSize: 14, color: grayColor),
            ),
            const SizedBox(height: 10),
            CustomInput(
              controller: emailController,
              hint: 'Email',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi untuk mengirim email reset password
                sendPasswordResetEmail();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: primaryColor,
              ),
              child: Text(
                "Reset Kata Sandi",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mengirim email reset password
  void sendPasswordResetEmail() {
    // Implementasi logika untuk mengirim email reset password
    // Anda dapat menggunakan Firebase atau metode reset password lainnya
    // Contoh:
    // FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    // Setelah itu, berikan umpan balik kepada pengguna, misalnya dengan menampilkan snackbar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email reset kata sandi telah dikirim.'),
      ),
    );
  }
}
