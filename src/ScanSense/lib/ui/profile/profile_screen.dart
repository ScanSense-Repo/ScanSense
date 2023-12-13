import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/widgets/custom_input.dart';

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

  String namaValue = "";
  String emailValue = "";
  String telpValue = "";

  GlobalKey<_ProfileScreenState> get profileKey => _profileKey;

  // Tambah variabel untuk menyimpan path gambar
  String imagePath = 'assets/illustrations/profile.png';

  void updateTextControllers() {}

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
            _buildProfilePicture(), // Panggil fungsi _buildProfilePicture
            const SizedBox(height: 16),
            Text(
              "Ubah Foto Profil",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
              textAlign: TextAlign.center,
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

  // Pindahkan fungsi _buildProfilePicture ke sini
  Widget _buildProfilePicture() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            _pickImage();
          },
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 6,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Tambah fungsi _pickImage untuk memilih gambar
  void _pickImage() {
    // Implementasi pemilihan gambar
    // Misalnya menggunakan package image_picker
  }
}
