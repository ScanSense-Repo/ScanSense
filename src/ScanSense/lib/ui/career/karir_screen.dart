import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scan_sense/common/styles.dart';
import 'package:scan_sense/ui/career/result_karir.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KarirScreen extends StatefulWidget {
  static const String routeName = '/karir-screen';

  const KarirScreen({Key? key}) : super(key: key);

  @override
  _KarirScreenState createState() => _KarirScreenState();
}

class _KarirScreenState extends State<KarirScreen> {
  String selectedValue = 'Pria';
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _umurController = TextEditingController();
  TextEditingController _pengalamankerjaController = TextEditingController();
  TextEditingController _pengalamanorganisasiController =
      TextEditingController();
  TextEditingController _ipkController = TextEditingController();
  TextEditingController _skillController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _jenisKelaminController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  void _handleDatePick(DateTime pickedDate) {
    setState(() {
      selectedDate = pickedDate;
    });
  }

  Future<void> sendDataToFirebase(User user) async {
    CollectionReference karirCollection =
        FirebaseFirestore.instance.collection('users');

    // Periksa apakah dokumen dengan ID pengguna sudah ada atau belum
    DocumentSnapshot userDoc = await karirCollection.doc(user.uid).get();

    if (userDoc.exists) {
      // Dokumen sudah ada, lakukan pembaruan data
      await karirCollection.doc(user.uid).update({
        'kriteria.pengalaman_kerja': _pengalamankerjaController.text,
        'kriteria.skill_sertifikat': _skillController.text,
        'kriteria.lokasi_kerja': _lokasiController.text,
        'kriteria.pengalaman_organisasi': _pengalamanorganisasiController.text,
        'kriteria.umur': _umurController.text,
        'kriteria.ipk': _ipkController.text,
        'name': _namaController.text,
        'phone_number': user.phoneNumber,
      });

      // Tampilkan pesan sukses atau lakukan tindakan setelah data berhasil diperbarui
      print('Data berhasil diperbarui di Firestore!');
    } else {
      // Dokumen belum ada, tambahkan dokumen baru
      Map<String, dynamic> data = {
        'email': user.email,
        'id': user.uid,
        'kriteria': {
          'pengalaman_kerja': _pengalamankerjaController.text,
          'skill_sertifikat': _skillController.text,
          'lokasi_kerja': _lokasiController.text,
          'pengalaman_organisasi': _pengalamanorganisasiController.text,
          'umur': _umurController.text,
          'ipk': _ipkController.text,
        },
        'name': _namaController.text,
        'phone_number': user.phoneNumber,
      };

      await karirCollection.doc(user.uid).set(data);

      // Tampilkan pesan sukses atau lakukan tindakan setelah data berhasil ditambahkan
      print('Data berhasil ditambahkan ke Firestore!');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> experienceOptions = [
      '>1 Tahun',
      '1-3 Tahun',
      'Lebih dari 5 Tahun'
    ];
    List<String> locationOptions = ['Luar Kota', 'Dalam Kota'];
    List<String> organizationExperienceOptions = ['Ya', 'Tidak'];
    List<String> skillOptions = [
      'Programming',
      'Design',
      'Marketing',
      'Communication',
      'Leadership',
      'Problem Solving',
      'Teamwork',
      'Adaptability',
      'Creativity',
      'Time Management',
      'Analytical Skills',
      'Customer Service',
      'Language Proficiency',
      'Project Management',
      'Networking',
      'Research',
      'Presentation Skills',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Karir",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Isi Data Dengan Jujur!",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile("Umur", _umurController,
                        keyboardType: TextInputType.number),
                    _buildListTileDropdown("Pengalaman Kerja",
                        _pengalamankerjaController, experienceOptions),
                    _buildListTileDropdown(
                        "Skill", _skillController, skillOptions),
                    _buildListTileDropdown(
                        "Lokasi", _lokasiController, locationOptions),
                    _buildListTileDropdown(
                        "Pengalaman Organisasi",
                        _pengalamanorganisasiController,
                        organizationExperienceOptions),
                    _buildListTile("IPK", _ipkController,
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                onPressed: () async {
                  // Handle save button pressed
                  if (_formKey.currentState?.validate() ?? false) {
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      await sendDataToFirebase(user);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data berhasil disimpan dan terkirim ke Firestore!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Color.fromARGB(255, 9, 193, 61),
                      ),
                    );

                    // Navigate to ResultKarirScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultKarirScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String label, TextEditingController controller,
      {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ":",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: 'Masukkan $label Anda.',
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $label.';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildListTileDate(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ":",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            _handleDatePick(pickedDate!);
          },
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 14),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildListTileDropdown(String label, TextEditingController controller,
      List<String> dropdownOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ":",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          hint: Text(
            'Pilih $label Anda',
            style: TextStyle(fontSize: 14),
          ),
          items: dropdownOptions
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select $label.';
            }
            return null;
          },
          onChanged: (value) {
            controller.text = value!;
          },
          onSaved: (value) {
            // Jika perlu, lakukan sesuatu ketika nilai disimpan
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
