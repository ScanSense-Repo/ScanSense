import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/model/rank.dart';
import 'package:scan_sense/domain/repositories/rank_repository.dart';

class CompanyNotifier extends ChangeNotifier {
  final RankRepository _rankRepository;

  CompanyNotifier(this._rankRepository);

  List<Rank>? _rankList;
  List<Rank>? get rankList => _rankList;

  Failure? _failure;
  bool _isLoading = false;

  Failure? get failure => _failure;
  bool get isLoading => _isLoading;

  Future<bool> getRankList(String bidang) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    final result = await _rankRepository.getRankList(bidang);

    return result.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();
      return false;
    }, (right) {
      _rankList = right;
      _isLoading = false;
      notifyListeners();
      return true;
    });
  }
}

final companyProvider = ChangeNotifierProvider<CompanyNotifier>((ref) {
  final rankRepository = ref.read(rankRepositoryProvider);

  return CompanyNotifier(rankRepository);
});
