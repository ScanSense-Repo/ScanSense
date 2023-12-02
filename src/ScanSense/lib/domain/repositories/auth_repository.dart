import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/base/provider/firebase_auth_provider.dart';
import 'package:scan_sense/base/provider/firestore_provider.dart';
import 'package:scan_sense/data/repositories/auth_repository_impl.dart';
import 'package:scan_sense/domain/model/auth.dart';
import 'package:scan_sense/domain/model/user.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> login(String email, String password);
  Future<Either<Failure, void>> register(
      String name, String email, String phoneNumber, String password);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, void>> createUser(User user);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  // final dio = ref.read(dioProvider);
  final firestore = ref.read(firestoreProvider);
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return AuthRepositoryImpl(firebaseAuth, firestore);
}
