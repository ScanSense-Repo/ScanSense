class UserProfile {
  final String name;
  final String email;
  final String phoneNumber;

  UserProfile({
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
