import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/domain/model/auth.dart';
import 'package:scan_sense/domain/repositories/auth_repository.dart';

class AuthNotifier extends ChangeNotifier {
  final AuthRepository _authRepository;

  Failure? _failure;
  bool _isLoading = false;
  Auth? _auth;

  Failure? get failure => _failure;
  bool get isLoading => _isLoading;
  Auth? get auth => _auth;

  AuthNotifier(this._authRepository);

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> editProfile(
      {required String name,
      required String email,
      required String phoneNumber}) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _authRepository.editProfile(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      );

      _isLoading = false;

      return response.fold((failure) {
        _failure = failure;
        _isLoading = false;
        notifyListeners();
        return false;
      }, (userProfile) {
        _isLoading = false;
        notifyListeners();
        return true;
      });
    } catch (e) {
      _failure = Failure('Gagal menyimpan perubahan profil: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    final response = await _authRepository.login(email, password);

    _isLoading = false;

    Future.delayed(const Duration(seconds: 3), () {
      _isLoading = false;
      notifyListeners();
    });
    // final response = await _authRepository.login(email, password);

    return _validateResponse(response);
  }

  Future<bool> _validateResponse(Either<Failure, Auth> response) {
    return response.fold<Future<bool>>(
      (failure) async {
        _failure = failure;
        return false;
      },
      (auth) async {
        _auth = auth;

        return true;
      },
    );
  }

  Future<bool> logout() async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    final response = await _authRepository.logout();

    return response.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();
      return false;
    }, (right) {
      _auth = null;
      _isLoading = false;
      notifyListeners();
      return true;
    });
  }

  Future<bool> register(
      String name, String email, String phoneNumber, String password) async {
    _failure = null;
    _isLoading = true;
    notifyListeners();

    final response =
        await _authRepository.register(name, email, phoneNumber, password);

    return response.fold((failure) {
      _failure = failure;
      _isLoading = false;
      notifyListeners();
      return false;
    }, (right) {
      _isLoading = false;
      notifyListeners();
      return true;
    });
  }
}

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthNotifier(authRepository);
});
