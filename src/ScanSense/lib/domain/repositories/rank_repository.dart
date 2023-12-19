import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/base/provider/dio_provider.dart';
import 'package:scan_sense/data/repositories/rank_repository_impl.dart';
import 'package:scan_sense/domain/model/rank.dart';

part 'rank_repository.g.dart';

abstract class RankRepository {
  Future<Either<Failure, List<Rank>>> getRankList(String bidang);
}

@riverpod
RankRepository rankRepository(Ref ref) {
  final dio = ref.read(dioProvider);
  return RankRepositoryImpl(dio);
}
