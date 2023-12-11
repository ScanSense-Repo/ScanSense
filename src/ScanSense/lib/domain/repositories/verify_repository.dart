import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/base/provider/firebase_auth_provider.dart';
import 'package:scan_sense/base/provider/firestore_provider.dart';
import 'package:scan_sense/base/provider/storage_provider.dart';
import 'package:scan_sense/data/repositories/verify_repository_impl.dart';

part 'verify_repository.g.dart';

abstract class VerifyRepository {
  Future<Either<Failure, bool>> verify(String name, String nik);
  Future<Either<Failure, bool>> saveResult(
      File ktp, String name, String nik, bool isValid);
}

@riverpod
VerifyRepository verifyRepository(Ref ref) {
  final firestore = ref.read(firestoreProvider);
  final firebaseStorage = ref.read(storageProvider);
  final fireabseAuth = ref.read(firebaseAuthProvider);

  return VerifyRepositoryImpl(firestore, firebaseStorage, fireabseAuth);
}
