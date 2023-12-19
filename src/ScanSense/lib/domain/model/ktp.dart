import 'package:freezed_annotation/freezed_annotation.dart';

part 'ktp.freezed.dart';
part 'ktp.g.dart';

@freezed
class Ktp with _$Ktp {
  factory Ktp(
      {required String nik,
      required String nama,
      required String ttl,
      required String jenisKelamin,
      required String alamat,
      required String rt,
      required String rw,
      required String kelDesa,
      required String kecamatan,
      required String agama,
      required String statusPerkawinan,
      required String pekerjaan,
      required String kewarganegaraan,
      required String berlakuHingga}) = _Ktp;

  factory Ktp.fromJson(Map<String, dynamic> json) => _$KtpFromJson(json);
}
