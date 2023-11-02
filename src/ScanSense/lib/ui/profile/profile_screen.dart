import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController cNama = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cTelp = TextEditingController();

  @override
  void initState() {
    cEmail.text = "ronny@gmail.com";
    cNama.text = "Ronny";
    cTelp.text = "0835627326372";
    // TODO: implement initState
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
