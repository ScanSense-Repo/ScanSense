import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';

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
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white, // Menetapkan warna putih sebagai latar belakang
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 36.0,
                color: primaryColor,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                timestamp,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
