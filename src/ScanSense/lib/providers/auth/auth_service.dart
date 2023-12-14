// providers/auth/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart' as fbUser;
import 'package:scan_sense/domain/model/auth.dart';
import 'package:scan_sense/domain/model/user.dart';

class AuthService {
  final fbUser.FirebaseAuth _auth = fbUser.FirebaseAuth.instance;

  Stream<Auth> authChanges() {
    return _auth.authStateChanges().map((fbUser.User? user) {
      return Auth(
        uid: user?.uid ?? '',
        // Use user directly from firebase_auth package
        user: user != null
            ? User(
                id: user.uid,
                name: user.displayName ?? '',
                email: user.email ?? '',
                phoneNumber: user.phoneNumber ?? '',
              )
            : User.empty(),
      );
    });
  }
}
