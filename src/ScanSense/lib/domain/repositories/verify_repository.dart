import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/base/provider/dio_provider.dart';
import 'package:scan_sense/base/provider/firebase_auth_provider.dart';
import 'package:scan_sense/base/provider/firestore_provider.dart';
import 'package:scan_sense/base/provider/storage_provider.dart';
import 'package:scan_sense/data/repositories/verify_repository_impl.dart';
import 'package:scan_sense/domain/model/ktp.dart';

part 'verify_repository.g.dart';

abstract class VerifyRepository {
  Future<Either<Failure, Ktp>> ocr(File ktp);
  Future<Either<Failure, bool>> verify(String name, String nik);
  Future<Either<Failure, bool>> saveResult(File file, Ktp ktp, bool isValid);
}

@riverpod
VerifyRepository verifyRepository(Ref ref) {
  final firestore = ref.read(firestoreProvider);
  final firebaseStorage = ref.read(storageProvider);
  final fireabseAuth = ref.read(firebaseAuthProvider);
  final dio = ref.read(dioProvider);

  return VerifyRepositoryImpl(firestore, firebaseStorage, fireabseAuth, dio);
}
