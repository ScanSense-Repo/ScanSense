import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/repositories/verify_repository.dart';

class VerifyRepositoryImpl implements VerifyRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  VerifyRepositoryImpl(
    this._firestore,
    this._firebaseStorage,
  );

  @override
  Future<Either<Failure, bool>> verify(File ktp) async {
    try {
      DateTime now = DateTime.now();

      final storageRef = FirebaseStorage.instance.ref();
      final ktpRef = storageRef.child("ktp/$now.jpg");

      await ktpRef.putFile(ktp);
      final ktpUrl = await ktpRef.getDownloadURL();

      await _firestore.collection("ktp").add({
        "nama": "dummy",
        "alamat": "dummy",
        "nik": "1212536125371",
        "ktpUrl": ktpUrl,
        "createdAt": now,
      });

      return Future.value(const Right(true));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }
}
