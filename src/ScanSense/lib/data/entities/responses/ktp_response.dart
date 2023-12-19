import 'package:json_annotation/json_annotation.dart';
import 'package:scan_sense/domain/model/ktp.dart';

part 'ktp_response.g.dart';

@JsonSerializable()
class KtpResponse {
  final String nik;
  final String nama;
  final String ttl;
  @JsonKey(name: "jenis_kelamin")
  final String jenisKelamin;
  final String alamat;
  final String rt;
  final String rw;
  @JsonKey(name: "kel_desa")
  final String kelDesa;
  final String kecamatan;
  final String agama;
  @JsonKey(name: "status_perkawinan")
  final String statusPerkawinan;
  final String pekerjaan;
  final String kewarganegaraan;
  @JsonKey(name: "berlaku_hingga")
  final String berlakuHingga;

  KtpResponse({
    required this.nik,
    required this.nama,
    required this.ttl,
    required this.jenisKelamin,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.kelDesa,
    required this.kecamatan,
    required this.agama,
    required this.statusPerkawinan,
    required this.pekerjaan,
    required this.kewarganegaraan,
    required this.berlakuHingga,
  });

  factory KtpResponse.fromJson(Map<String, dynamic> json) =>
      _$KtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KtpResponseToJson(this);

  Ktp toKtp() => Ktp(
        nik: nik,
        nama: nama,
        ttl: ttl,
        jenisKelamin: jenisKelamin,
        alamat: alamat,
        rt: rt,
        rw: rw,
        kelDesa: kelDesa,
        kecamatan: kecamatan,
        agama: agama,
        statusPerkawinan: statusPerkawinan,
        pekerjaan: pekerjaan,
        kewarganegaraan: kewarganegaraan,
        berlakuHingga: berlakuHingga,
      );
}
