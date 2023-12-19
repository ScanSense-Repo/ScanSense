import 'package:json_annotation/json_annotation.dart';
import 'package:scan_sense/domain/model/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String role;

  UserResponse({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toUser() => User(
        id: id,
        email: email,
        name: name,
        phoneNumber: phoneNumber ?? "-",
        role: role,
      );
}
