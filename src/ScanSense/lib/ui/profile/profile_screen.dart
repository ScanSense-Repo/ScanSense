import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/widgets/custom_input.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<NavigatorState> navigatorKunci = GlobalKey<NavigatorState>();
final GlobalKey<_ProfileScreenState> _profileKey = GlobalKey();

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
  final GlobalKey<_ProfileScreenState> _profileKey = GlobalKey();

  GlobalKey<_ProfileScreenState> get profileKey => _profileKey;

  // Tambah variabel untuk menyimpan path gambar
  String imagePath = 'assets/illustrations/profile.png';

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _updateTextControllers();
    });
    super.initState();
  }

  void _updateTextControllers() {
    final auth = ref.read(authProvider);
    setState(() {
      cEmail.text = auth.auth?.user.email ?? "";
      cNama.text = auth.auth?.user.name ?? "";
      cTelp.text = auth.auth?.user.phoneNumber ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

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
            const SizedBox(height: 16),
            CircleAvatar(
              radius:
                  80, // Adjust the radius as needed// Set your desired background color
              child: ClipOval(
                child: Image.asset(
                  'assets/profile/img1.png',
                  width: 160, // Adjust the width as needed
                  height: 160, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomInput(
              controller: cNama,
              hint: "7312042510720002",
            ),
            const SizedBox(height: 16),
            CustomInput(
              controller: cEmail,
              hint: "E-mail",
            ),
            const SizedBox(height: 16),
            CustomInput(
              controller: cTelp,
              hint: "No Telepon",
            ),
            const SizedBox(
              height: 20,
            ),
            auth.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : ElevatedButton.icon(
                    onPressed: () async {
                      // Simpan perubahan profil pengguna
                      final success = await ref.read(authProvider).editProfile(
                            name: cNama.text,
                            email: cEmail.text,
                            phoneNumber: cTelp.text,
                          );

                      if (success) {
                        _updateTextControllers();
                        AnimatedSnackBar.material(
                          "Profil berhasil diperbarui!",
                          type: AnimatedSnackBarType.success,
                          duration: const Duration(seconds: 2),
                        ).show(context);
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
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
