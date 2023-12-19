import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scan_sense/base/failures/failure.dart';
import 'package:scan_sense/data/entities/responses/user_response.dart';
import 'package:scan_sense/domain/model/UserProfile.dart';
import 'package:scan_sense/domain/model/auth.dart';
import 'package:scan_sense/domain/model/user.dart' as model;
import 'package:scan_sense/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // final Dio _dio;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepositoryImpl(
    this._firebaseAuth,
    this._firestore,
  );

  @override
  Future<Either<Failure, UserProfile>> editProfile(
      {required String name,
      required String email,
      required String phoneNumber}) async {
    try {
      // Simulasikan permintaan ke server atau penyimpanan profil
      // Gantilah ini dengan implementasi sesuai kebutuhan Anda
      await Future.delayed(const Duration(seconds: 2));

      // Dapatkan profil pengguna yang diperbarui dari server atau penyimpanan
      final updatedProfile = UserProfile(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      );

      // Simpan perubahan ke Firestore atau penyimpanan data yang sesuai
      // Gantilah logika ini dengan implementasi sesuai kebutuhan Anda
      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update(updatedProfile.toJson());

      // Return profil pengguna yang diperbarui
      return Right(updatedProfile);
    } catch (e) {
      // Tangani kesalahan lainnya jika ada
      return Left(Failure(e.toString() ?? "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Auth>> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = await getUser();
      return Right(Auth(
          uid: userCredential.user!.uid,
          user: user.fold((left) => model.User.empty(), (user) => user)));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    try {
      _firebaseAuth.signOut();
      return Future.value(const Right(true));
    } on FirebaseAuthException catch (e) {
      return Future.value(Left(Failure(e.message ?? "Something went wrong")));
    }
  }

  @override
  Future<Either<Failure, void>> register(
      String name, String email, String phoneNumber, String password) async {
    try {
      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await createUser(model.User(
          id: newUser.user!.uid,
          name: name,
          email: email,
          phoneNumber: phoneNumber));
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }

  @override
  Future<Either<Failure, model.User>> getUser() async {
    try {
      DocumentSnapshot response = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      final user =
          UserResponse.fromJson(response.data() as Map<String, dynamic>);
      return Right(user.toUser());
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }

  @override
  Future<Either<Failure, void>> createUser(model.User user) async {
    try {
      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(user.toJson());
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(
          Left(Failure(e.toString() ?? "Something went wrong")));
    }
  }
}
