import 'package:scan_sense/data/ktp.dart';

class ListKtp {
  List<Ktp>? ktp;

  ListKtp({this.ktp});

  ListKtp.fromJson(Map<String, dynamic> json) {
    if (json['ktp'] != null) {
      ktp = <Ktp>[];
      json['ktp'].forEach((v) {
        ktp!.add(Ktp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ktp != null) {
      data['ktp'] = ktp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
