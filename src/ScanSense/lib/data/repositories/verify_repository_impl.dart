import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/data/entities/responses/ktp_response.dart';
import 'package:scan_sense/domain/model/ktp.dart';
import 'package:scan_sense/domain/repositories/verify_repository.dart';
import 'package:uuid/uuid.dart';

class VerifyRepositoryImpl implements VerifyRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;
  final Dio _dio;

  VerifyRepositoryImpl(
    this._firestore,
    this._firebaseStorage,
    this._firebaseAuth,
    this._dio,
  );

  @override
  Future<Either<Failure, bool>> saveResult(
      File file, Ktp ktp, bool isValid) async {
    try {
      DateTime now = DateTime.now();

      final storageRef = FirebaseStorage.instance.ref();
      final ktpRef = storageRef.child("ktp/$now.jpg");

      await ktpRef.putFile(file);
      final ktpUrl = await ktpRef.getDownloadURL();

      User user = _firebaseAuth.currentUser!;

      var uuid = const Uuid();
      final ktpId = uuid.v4();

      await _firestore
          .collection("users")
          .doc(user.uid)
          .collection("ktp")
          .doc(ktpId)
          .set({
        "id": ktpId,
        "nik": ktp.nik,
        "nama": ktp.nama,
        "ttl": ktp.ttl,
        "alamat": ktp.alamat,
        "rt": ktp.rt,
        "rw": ktp.rw,
        "kelDesa": ktp.kelDesa,
        "kecamatan": ktp.kecamatan,
        "jenisKelamin": ktp.jenisKelamin,
        "agama": ktp.agama,
        "statusPerkawinan": ktp.statusPerkawinan,
        "pekerjaan": ktp.pekerjaan,
        "kewarganegaraan": ktp.kewarganegaraan,
        "berlakuHingga": ktp.berlakuHingga,
        "isValid": isValid,
        "ktpUrl": ktpUrl,
        "createdAt": now,
      });

      return Future.value(const Right(true));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }

  @override
  Future<Either<Failure, bool>> verify(String name, String nik) async {
    try {
      final mahasiswaRef = _firestore.collection("mahasiswa");
      QuerySnapshot result = await mahasiswaRef.get();

      List<Map<String, dynamic>> mahasiswas = result.docs.map((e) {
        final data = e.data() as Map<String, dynamic>;
        return {
          "nama": data["nama"] ?? "-",
          "nik": data["nik"] ?? "-",
        };
      }).toList();

      Map<String, dynamic>? mahasiswa = mahasiswas.where((element) {
        return element["nama"].toString().toUpperCase() == name.toUpperCase() &&
            element["nik"] == nik;
      }).firstOrNull;

      if (mahasiswa == null) {
        return Future.value(const Right(false));
      }

      return Future.value(const Right(true));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }

  @override
  Future<Either<Failure, Ktp>> ocr(File ktp) async {
    final result = await _dio.post('ocr-ktp',
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(ktp.path),
        }));

    final res = KtpResponse.fromJson(result.data).toKtp();

    return Future.value(Right(res));
    // try {
    //   final result = await _dio.post('ocr-ktp',
    //       data: FormData.fromMap({
    //         "ktp": await MultipartFile.fromFile(ktp.path),
    //       }));

    //   final res = KtpResponse.fromJson(result.data).toKtp();

    //   return Future.value(Right(res));
    // } catch (e) {
    //   return Future.value(
    //       Left(Failure(e.toString() ?? "Something went wrong")));
    // }
  }
}
