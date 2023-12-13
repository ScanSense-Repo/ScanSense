import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/providers/scan/scan_provider.dart';
import 'package:scan_sense/ui/layout/layout_screen.dart';
import 'package:scan_sense/widgets/custom_input.dart';

class ResultScreen extends ConsumerStatefulWidget {
  static const String routeName = '/result-screen';

  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  TextEditingController cNik = TextEditingController();
  TextEditingController cNama = TextEditingController();
  TextEditingController cTtl = TextEditingController();
  TextEditingController cGender = TextEditingController();
  TextEditingController cAlamat = TextEditingController();

  @override
  void initState() {
    cNik.text = "3507322912020002";
    cNama.text = "wiradarma nurmagika bagaskara";
    cTtl.text = "CELLENGENGE, 25-10-1972";
    cGender.text = "LAKI-LAKI";
    cAlamat.text = "JL. MERDEKA NO 43";
    // TODO: implement initState
    super.initState();
  }

  Future<void> verifyKtp() async {
    final scan = ref.read(scanProvider.notifier);

    final verify = await scan.verify(
      name: cNama.text,
      nik: cNik.text,
    );

    await scan.saveResult(name: cNama.text, nik: cNik.text, isValid: verify);
    if (verify) {
      showSuccessDialog();
    } else {
      showFailedDialog();
    }

    // final result = await scan.saveResult(name: cNama.text, nik: cNik.text);
    // if (result) {
    //   if (mounted) {
    //     AnimatedSnackBar.material(
    //       "Berhasil verifikasi KTP",
    //       type: AnimatedSnackBarType.success,
    //       duration: const Duration(seconds: 2),
    //     ).show(context);
    //   }
    // } else {
    //   if (mounted) {
    //     AnimatedSnackBar.material(
    //       "Gagal verifikasi KTP",
    //       type: AnimatedSnackBarType.warning,
    //       duration: const Duration(seconds: 2),
    //     ).show(context);
    //   }
    // }

    // Navigation.replaceUntilNamed(routeName: LayoutScreen.routeName);
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GiffyDialog.image(
          Image.asset(
            "assets/illustrations/result.png",
            height: 200,
          ),
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          title: Text(
            'KTP Valid',
            style: GoogleFonts.poppins(
                color: successColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'KTP anda telah terverifikasi',
                style: GoogleFonts.poppins(
                  color: successColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigation.replaceUntilNamed(
                          routeName: LayoutScreen.routeName),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        "Kembali Ke Beranda",
                        style: GoogleFonts.poppins(color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GiffyDialog.image(
          Image.asset(
            "assets/illustrations/result.png",
            height: 200,
          ),
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          title: Text(
            'KTP Tidak Valid',
            style: GoogleFonts.poppins(
                color: dangerColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pastikan data yang anda inputkan benar',
                style: GoogleFonts.poppins(
                  color: dangerColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigation.replaceUntilNamed(
                          routeName: LayoutScreen.routeName),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        "Kembali Ke Beranda",
                        style: GoogleFonts.poppins(color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scan = ref.watch(scanProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigation.back(),
                          child: const Icon(Icons.arrow_back_rounded),
                        ),
                        Text(
                          "Verifikasi KTP",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: scan.imagePath == null
                            ? Image.asset(
                                'assets/illustrations/ktp.png',
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                Uint8List.fromList(scan.imageUint!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomInput(
                      controller: cNik,
                      hint: "7312042510720002",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cNama,
                      hint: "E-mail",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cTtl,
                      hint: "No Telepon",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cGender,
                      hint: "Kata Sandi",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cAlamat,
                      hint: "Konfirmasi Kata Sandi",
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await verifyKtp();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: scan.isLoading,
                            child: const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: scan.isLoading,
                            child: const SizedBox(
                              width: 8,
                            ),
                          ),
                          Text(
                            "Submit",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            ),
                          ),
                        ],
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
