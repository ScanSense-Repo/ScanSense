import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/model/rank.dart';
import 'package:scan_sense/domain/repositories/rank_repository.dart';

class RankRepositoryImpl implements RankRepository {
  final Dio _dio;

  RankRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, List<Rank>>> getRankList(String bidang) async {
    try {
      final result = await _dio.get('/users?bidang=$bidang');

      final rankList = (result.data as List)
          .map((e) => Rank.fromJson(e as Map<String, dynamic>))
          .toList();

      return Future.value(Right(rankList));
    } catch (e) {
      return Future.value(Left(Failure(e.toString())));
    }
  }
}
