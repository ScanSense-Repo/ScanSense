import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/base/provider/dio_provider.dart';
import 'package:scan_sense/data/repositories/auth_repository_imp.dart';
import 'package:scan_sense/domain/model/auth.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> login(String email, String password);
  Future<Either<Failure, Auth>> register(
      String name, String email, String password);
  Future<Either<Failure, Auth>> logout();
}

@riverpod
AuthRepository authRepositoryProvider(Ref ref) {
  final dio = ref.read(dioProvider);
  return AuthRepositoryImp(dio);
}
