import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scan_sense/domain/model/rank.dart';
import 'package:scan_sense/domain/repositories/rank_repository.dart';

part 'rank_provider.g.dart';

@riverpod
FutureOr<List<Rank>> rank(Ref ref, String bidang) async {
  final repository = ref.read(rankRepositoryProvider);

  final result = await repository.getRankList(bidang);

  return result.fold((failure) {
    return throw failure;
  }, (rank) {
    return rank;
  });
}
