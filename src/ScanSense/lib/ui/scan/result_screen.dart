import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/domain/model/ktp.dart';
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
  TextEditingController cRt = TextEditingController();
  TextEditingController cRw = TextEditingController();
  TextEditingController cKelDesa = TextEditingController();
  TextEditingController cKecamatan = TextEditingController();
  TextEditingController cAgama = TextEditingController();
  TextEditingController cStatus = TextEditingController();
  TextEditingController cPekerjaan = TextEditingController();
  TextEditingController cKewarganegaraan = TextEditingController();
  TextEditingController cBerlaku = TextEditingController();

  @override
  void initState() {
    final scan = ref.read(scanProvider);
    final Ktp ktp = scan.ktp!;

    cNik.text = ktp.nik;
    cNama.text = ktp.nama;
    cTtl.text = ktp.ttl;
    cGender.text = ktp.jenisKelamin;
    cAlamat.text = ktp.alamat;
    cRt.text = ktp.rt;
    cRw.text = ktp.rw;
    cKelDesa.text = ktp.kelDesa;
    cKecamatan.text = ktp.kecamatan;
    cAgama.text = ktp.agama;
    cStatus.text = ktp.statusPerkawinan;
    cPekerjaan.text = ktp.pekerjaan;
    cKewarganegaraan.text = ktp.kewarganegaraan;
    cBerlaku.text = ktp.berlakuHingga;

    super.initState();
  }

  Future<void> verifyKtp() async {
    final scan = ref.read(scanProvider.notifier);

    final verify = await scan.verify(
      name: cNama.text,
      nik: cNik.text,
    );

    Ktp ktp = Ktp(
        nik: cNik.text,
        nama: cNama.text,
        ttl: cTtl.text,
        jenisKelamin: cGender.text,
        alamat: cAlamat.text,
        rt: cRt.text,
        rw: cRw.text,
        kelDesa: cKelDesa.text,
        kecamatan: cKecamatan.text,
        agama: cAgama.text,
        statusPerkawinan: cStatus.text,
        pekerjaan: cPekerjaan.text,
        kewarganegaraan: cKewarganegaraan.text,
        berlakuHingga: cBerlaku.text);

    await scan.saveResult(ktp: ktp, isValid: verify);
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
                      hint: "Nama",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cTtl,
                      hint: "Ttl",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: inputBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width - 48,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        initialSelection: "Laki-Laki",
                        controller: cGender,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                              value: "Laki-Laki", label: "Laki-Laki"),
                          DropdownMenuEntry(
                              value: "Perempuan", label: "Perempuan")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cAlamat,
                      hint: "Alamat",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cRt,
                      hint: "Rt",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cRw,
                      hint: "Rw",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cKelDesa,
                      hint: "Kel/Desa",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cKecamatan,
                      hint: "Kecamatan",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: inputBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width - 48,
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        initialSelection: "Islam",
                        controller: cAgama,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: "Islam", label: "Islam"),
                          DropdownMenuEntry(value: "Kristen", label: "Kristen"),
                          DropdownMenuEntry(value: "Budha", label: "Budha"),
                          DropdownMenuEntry(value: "Hindu", label: "Hindu"),
                          DropdownMenuEntry(
                              value: "Konghucu", label: "Konghucu"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cStatus,
                      hint: "Status Perkawinan",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cPekerjaan,
                      hint: "Pekerjaan",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cKewarganegaraan,
                      hint: "Kewarganegaraan",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomInput(
                      controller: cBerlaku,
                      hint: "Berlaku Hingga",
                    ),
                    const SizedBox(
                      height: 16,
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
