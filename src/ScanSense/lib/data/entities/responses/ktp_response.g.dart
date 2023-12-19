// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ktp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KtpResponse _$KtpResponseFromJson(Map<String, dynamic> json) => KtpResponse(
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      ttl: json['ttl'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      alamat: json['alamat'] as String,
      rt: json['rt'] as String,
      rw: json['rw'] as String,
      kelDesa: json['kel_desa'] as String,
      kecamatan: json['kecamatan'] as String,
      agama: json['agama'] as String,
      statusPerkawinan: json['status_perkawinan'] as String,
      pekerjaan: json['pekerjaan'] as String,
      kewarganegaraan: json['kewarganegaraan'] as String,
      berlakuHingga: json['berlaku_hingga'] as String,
    );

Map<String, dynamic> _$KtpResponseToJson(KtpResponse instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'ttl': instance.ttl,
      'jenis_kelamin': instance.jenisKelamin,
      'alamat': instance.alamat,
      'rt': instance.rt,
      'rw': instance.rw,
      'kel_desa': instance.kelDesa,
      'kecamatan': instance.kecamatan,
      'agama': instance.agama,
      'status_perkawinan': instance.statusPerkawinan,
      'pekerjaan': instance.pekerjaan,
      'kewarganegaraan': instance.kewarganegaraan,
      'berlaku_hingga': instance.berlakuHingga,
    };
