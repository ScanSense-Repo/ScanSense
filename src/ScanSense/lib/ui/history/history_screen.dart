import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scan_sense/providers/auth/auth_provider.dart';
import 'package:scan_sense/utils/helper.dart';

enum SortOrder { ascending, descending }

enum FilterStatus { all, valid, invalid }

class HistoryScreen extends StatefulWidget {
  static const String routeName = '/history';

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // pengguna yang login
  final User? user = FirebaseAuth.instance.currentUser;
  late User? users;
  List<Map<String, dynamic>> historyData = [];

  SortOrder sortOrder = SortOrder.descending;
  FilterStatus filterStatus = FilterStatus.all;

  void setSortOrder(SortOrder order) {
    setState(() {
      sortOrder = order;
      fetchData(context);
    });
  }

  void setFilterStatus(FilterStatus status) {
    setState(() {
      filterStatus = status;
      fetchData(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser(); // Panggil fungsi _getUser() pada saat initState()
    fetchData(context); // Panggil fungsi fetchData() pada saat initState()
  }

  // Fungsi untuk mendapatkan informasi pengguna yang login
  Future<void> _getUser() async {
    try {
      // Panggil fungsi user() untuk mendapatkan informasi pengguna yang login
      users = await FirebaseAuth.instance.currentUser;
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchData(BuildContext context) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        Query<Map<String, dynamic>> query = FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .collection('ktp');

        if (sortOrder == SortOrder.descending) {
          query = query.orderBy(
            'createdAt',
            descending: true,
          );
        } else {
          query = query.orderBy(
            'createdAt',
            descending: false,
          );
        }

        // // Filter based on isValid status
        if (filterStatus == FilterStatus.valid) {
          query = query.where('isValid', isEqualTo: true);
        } else if (filterStatus == FilterStatus.invalid) {
          query = query.where('isValid', isEqualTo: false);
        }

        final QuerySnapshot ktpResult = await query.get();
        final List<Map<String, dynamic>> ktpData = [];

        // Debugging: Print dokumen KTP
        ktpResult.docs.forEach((doc) {
          Map<String, dynamic> data = {
            'nik': doc['nik'] ?? "-",
            'name': doc['nama'] ?? "-",
            'createdAt': doc['createdAt'] ?? "-",
            'isValid': doc['isValid'] ?? false,
            'ktpUrl': doc['ktpUrl'] ?? "-",
            'jenisKelamin': doc['jenisKelamin'] ?? "-",
            'agama': doc['agama'] ?? "-",
            'kewarganegaraan': doc['kewarganegaraan'] ?? "-",
            'ttl': doc['ttl'] ?? "-",
            'rt': doc['rt'] ?? "-",
            'rw': doc['rw'] ?? "-",
            'kelDesa': doc['kelDesa'] ?? "-",
            'kecamatan': doc['kecamatan'] ?? "-",
            'pekerjaan': doc['pekerjaan'] ?? "-",
            'berlakuHingga': doc['berlakuHingga'] ?? "-",
          };
          print('Data: $data');

          // Menambahkan data ke dalam daftar
          ktpData.add(data);
        });

        historyData = ktpData;

        // Memperbarui tampilan dengan jumlah kartu yang sesuai
        setState(() {});
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void showDetail(Map<String, dynamic> data) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (BuildContext context) {
        return GiffyBottomSheet.image(
          Image.network(
            "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
            height: 0,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
          title: const Text(
            'Detail Riwayat',
            textAlign: TextAlign.start,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NIK : ${data["nik"]} ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Nama : ${data["name"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Tempat/Tgl Lahir : ${data['ttl']}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Jenis Kelamin : ${data["jenisKelamin"]} ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "RT/RW : ${data["rt"]}/${data["rw"]}  ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Kel/Desa :  ${data["kelDesa"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Kecamatan : ${data['kecamatan']}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Agama : ${data["agama"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Status Perkerjaan : ${data["pekerjaan"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Kewarganegaraan : ${data['kewarganegaraan']}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Berlaku Hingga : ${data["berlakuHingga"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(
                'Tutup',
                style: GoogleFonts.poppins(color: primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          AppBar(
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Detail Riwayat",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black,
                ),
                Text(
                  "${historyData.length} data",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<SortOrder>(
                      value: sortOrder,
                      onChanged: (SortOrder? newValue) {
                        if (newValue != null) {
                          setSortOrder(newValue);
                          fetchData(context); // Fetch data when sorting changes
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: SortOrder.ascending,
                          child: Text('Terlama'),
                        ),
                        DropdownMenuItem(
                          value: SortOrder.descending,
                          child: Text('Terbaru'),
                        ),
                      ],
                    ),
                    DropdownButton<FilterStatus>(
                      value: filterStatus,
                      onChanged: (FilterStatus? newValue) {
                        if (newValue != null) {
                          setFilterStatus(newValue);
                          fetchData(context); // Fetch data when filter changes
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: FilterStatus.all,
                          child: Text('Semua'),
                        ),
                        DropdownMenuItem(
                          value: FilterStatus.valid,
                          child: Text('Valid'),
                        ),
                        DropdownMenuItem(
                          value: FilterStatus.invalid,
                          child: Text('Invalid'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: historyData.isEmpty
                ? Center(
                    child: Text("Tidak ada riwayat"),
                  )
                : ListView.builder(
                    itemCount: historyData.length,
                    itemBuilder: (context, index) {
                      return CardContentWidget(historyData[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget CardContentWidget(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          showDetail(data); // Anda mungkin ingin mengirim data ke showDetail
        },
        child: Card(
          shadowColor: Colors.grey[200],
          surfaceTintColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data['nik'], // Menggunakan NIK dari data
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                        color: data['isValid'] == true
                            ? successLightColor
                            : dangerLightColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          data['isValid'] == true ? "Valid" : "Tidak Valid",
                          style: GoogleFonts.poppins(
                            color: data['isValid'] == true
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Nama',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(
                              data['name'], // Menggunakan nama dari data
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 45,
                      width: 1,
                      color: const Color.fromARGB(30, 0, 0, 0),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: Text(
                              'Tanggal',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 13.0, bottom: 8.0),
                            child: Text(
                              getTanggal((data['createdAt'] as Timestamp?)
                                      ?.toDate()) ??
                                  'N/A',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
