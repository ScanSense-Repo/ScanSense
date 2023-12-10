import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const String routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  TextEditingController cNama = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cTelp = TextEditingController();

  @override
  void initState() {
    final auth = ref.read(authProvider);
    cEmail.text = auth.auth?.user.email ?? "";
    cNama.text = auth.auth?.user.name ?? "";
    cTelp.text = auth.auth?.user.phoneNumber ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Profile",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/illustrations/profile.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Ubah Foto Profil",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomInput(
              controller: cNama,
              hint: "7312042510720002",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomInput(
              controller: cEmail,
              hint: "E-mail",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomInput(
              controller: cTelp,
              hint: "No Telepon",
            ),
            const SizedBox(
              height:
                  20, // Atur ketinggian sedikit agar tombol tidak terlalu dekat dengan input
            ),
            ElevatedButton.icon(
              onPressed: () async {
                // Simpan perubahan profil pengguna
                final success = await ref.read(authProvider).editProfile(
                      name: cNama.text,
                      email: cEmail.text,
                      phoneNumber: cTelp.text,
                    );

                if (success) {
                  AnimatedSnackBar.material(
                    "Profil berhasil diperbarui!",
                    type: AnimatedSnackBarType.success,
                    duration: const Duration(seconds: 2),
                  ).show(context);

                  setState(() {});
                } else {
                  // Gagal menyimpan perubahan profil, tampilkan pesan kesalahan
                  AnimatedSnackBar.material(
                    "Gagal menyimpan perubahan profil!",
                    type: AnimatedSnackBarType.error,
                    duration: const Duration(seconds: 2),
                  ).show(context);
                }
              },
              icon: const Icon(Icons.save, color: Colors.white),
              label: Text(
                "Simpan",
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
          ],
        ),
      ),
    );
  }
}
