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
                )),
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
              height: 60,
            ),
            Container(
              width: 350,
              height: 60,
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Simpan perubahan profil pengguna
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
            ),
          ],
        ),
      ),
    );
  }
}
