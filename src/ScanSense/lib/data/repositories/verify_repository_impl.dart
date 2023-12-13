import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/repositories/verify_repository.dart';

class VerifyRepositoryImpl implements VerifyRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;

  VerifyRepositoryImpl(
    this._firestore,
    this._firebaseStorage,
    this._firebaseAuth,
  );

  @override
  Future<Either<Failure, bool>> saveResult(
      File ktp, String name, String nik, bool isValid) async {
    try {
      DateTime now = DateTime.now();

      final storageRef = FirebaseStorage.instance.ref();
      final ktpRef = storageRef.child("ktp/$now.jpg");

      await ktpRef.putFile(ktp);
      final ktpUrl = await ktpRef.getDownloadURL();

      User user = _firebaseAuth.currentUser!;

      await _firestore.collection("users").doc(user.uid).collection("ktp").add({
        "nama": name,
        "alamat": "dummy",
        "nik": nik,
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

      print(mahasiswa);
      if (mahasiswa == null) {
        return Future.value(const Right(false));
      }

      return Future.value(const Right(true));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }
}
