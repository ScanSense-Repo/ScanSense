import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/model/user.dart';
import 'package:scan_sense/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImp(
    this._dio,
  );

  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    return;
  }

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    return;
  }

  @override
  Future<Either<Failure, User>> logout() async {
    return;
  }
}
