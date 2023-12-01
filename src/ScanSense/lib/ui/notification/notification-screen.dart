import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/navigation.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/profile/profile_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:scan_sense/ui/about us/about_us.dart';
import 'package:scan_sense/widgets/logout-pop.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notifikasi-screen';

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Notifikasi",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w600, color: blackColor),
          ),
        ),
      ),
      body: ListView(
        children: [
          buildNotificationCard(
            title: "Pembaruan Fitur: Scan Wajah Tersedia! 🌟",
            description:
                "Kini, Anda dapat menggunakan fitur scan wajah untuk verifikasi identitas dengan lebih cepat.",
            icon: Icons.face, // Ganti dengan ikon yang sesuai
            timestamp: "5 menit yang lalu",
            onPressed: () {
              // Tambahkan aksi yang sesuai
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => FaceScanScreen()));
            },
          ),
          buildNotificationCard(
            title: "Penawaran Spesial: Upgrade ke Premium! 💎",
            description:
                "Dapatkan akses ke fitur premium dan nikmati scan tanpa batas. Penawaran terbatas!",
            icon: Icons.star, // Ganti dengan ikon yang sesuai
            timestamp: "1 jam yang lalu",
            onPressed: () {
              // Tambahkan aksi yang sesuai
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradePremiumScreen()));
            },
          ),
          buildNotificationCard(
            title: "Notifikasi Urgent: Verifikasi KTP Anda! ⚠️",
            description:
                "Verifikasi KTP Anda sekarang untuk menghindari pembatasan akses. Segera lakukan!",
            icon: Icons.warning, // Ganti dengan ikon yang sesuai
            timestamp: "2 jam yang lalu",
            onPressed: () {
              // Tambahkan aksi yang sesuai
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyKTPScreen()));
            },
          ),
          buildNotificationCard(
            title: "Scan Sense News: Kini Mendukung iOS! 🍏",
            description:
                "Aplikasi Scan Sense sekarang tersedia di iOS. Unduh sekarang dan nikmati kemudahan scan di perangkat Apple Anda.",
            icon: Icons.phone_iphone, // Ganti dengan ikon yang sesuai
            timestamp: "1 hari yang lalu",
            onPressed: () {
              // Tambahkan aksi yang sesuai
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadIOSScreen()));
            },
          ),
          buildNotificationCard(
            title: "Selamat! Anda Pengguna Aktif Terbaik Bulan Ini! 🏆",
            description:
                "Terima kasih atas penggunaan aktif Anda! Nikmati akses eksklusif sebagai pengguna terbaik bulan ini.",
            icon: Icons.favorite, // Ganti dengan ikon yang sesuai
            timestamp: "1 minggu yang lalu",
            onPressed: () {
              // Tambahkan aksi yang sesuai
              // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => ExclusiveAccessScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget buildNotificationCard({
    required String title,
    required String description,
    required IconData icon,
    required String timestamp,
    required Function onPressed,
  }) {
    return Card(
      margin: EdgeInsets.all(16.0), // Sesuaikan nilai margin sesuai kebutuhan
      color: whiteColor, // Ubah warna latar belakang menjadi putih
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(timestamp),
        onTap: () {
          onPressed();
        },
      ),
    );
  }
}
