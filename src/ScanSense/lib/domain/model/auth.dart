import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scan_sense/domain/model/user.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  factory Auth({
    required String token,
    required User user,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
