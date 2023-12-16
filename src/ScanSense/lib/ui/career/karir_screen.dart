import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scan_sense/common/styles.dart';

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
  TextEditingController _pengalamanController = TextEditingController();
  TextEditingController _ipkController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  void _handleDatePick(DateTime pickedDate) {
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> genderOptions = ['Laki-Laki', 'Perempuan'];
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
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildListTile("NIK", _nikController,
                        keyboardType: TextInputType.number),
                    _buildListTile("Nama", _namaController),
                    _buildListTileDate("Tanggal Lahir"),
                    _buildListTileDropdown(
                        "Jenis Kelamin", selectedValue, genderOptions),
                    _buildListTile("Alamat", _alamatController),
                    _buildListTile("Umur", _umurController,
                        keyboardType: TextInputType.number),
                    _buildListTileDropdown(
                        "Pengalaman Kerja", selectedValue, experienceOptions),
                    _buildListTileDropdown(
                        "Skill", selectedValue, skillOptions),
                    _buildListTileDropdown(
                        "Lokasi", selectedValue, locationOptions),
                    _buildListTileDropdown("Pengalaman Organisasi",
                        selectedValue, organizationExperienceOptions),
                    _buildListTile("IPK", _ipkController,
                        keyboardType: TextInputType.number),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      primaryColor, // Ganti dengan warna latar belakang yang diinginkan
                ),
                onPressed: () {
                  // Handle save button pressed
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data berhasil disimpan!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Color.fromARGB(255, 9, 193, 61), // Sesuaikan dengan warna yang diinginkan
                      ),
                    );
                  }
                },
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color:
                        Colors.white, // Ganti dengan warna teks yang diinginkan
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

  Widget _buildListTileDropdown(
      String label, String selectedValue, List<String> dropdownOptions) {
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
            // Do something when the selected item is changed.
          },
          onSaved: (value) {
            setState(() {
              selectedValue = value!;
            });
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
