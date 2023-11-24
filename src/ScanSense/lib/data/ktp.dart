class Ktp {
  String? nik;
  String? nama;
  String? ttl;
  String? gender;
  String? rtRw;
  String? kelDesa;
  String? kecamatan;
  String? agama;
  String? pekerjaan;
  String? kewarganegaraan;
  String? berlakuHingga;
  bool? isValid;
  String? scanAt;

  Ktp(
      {this.nik,
      this.nama,
      this.ttl,
      this.gender,
      this.rtRw,
      this.kelDesa,
      this.kecamatan,
      this.agama,
      this.pekerjaan,
      this.kewarganegaraan,
      this.berlakuHingga,
      this.isValid,
      this.scanAt});

  Ktp.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    ttl = json['ttl'];
    gender = json['gender'];
    rtRw = json['rt_rw'];
    kelDesa = json['kel_desa'];
    kecamatan = json['kecamatan'];
    agama = json['agama'];
    pekerjaan = json['pekerjaan'];
    kewarganegaraan = json['kewarganegaraan'];
    berlakuHingga = json['berlaku_hingga'];
    isValid = json['is_valid'];
    scanAt = json['scan_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['nama'] = nama;
    data['ttl'] = ttl;
    data['gender'] = gender;
    data['rt_rw'] = rtRw;
    data['kel_desa'] = kelDesa;
    data['kecamatan'] = kecamatan;
    data['agama'] = agama;
    data['pekerjaan'] = pekerjaan;
    data['kewarganegaraan'] = kewarganegaraan;
    data['berlaku_hingga'] = berlakuHingga;
    data['is_valid'] = isValid;
    data['scan_at'] = scanAt;
    return data;
  }
}
