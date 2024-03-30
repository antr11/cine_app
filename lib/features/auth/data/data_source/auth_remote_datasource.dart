import 'package:firebase_auth/firebase_auth.dart';

abstract class NewAuthRemoteDatasource {
  Future<UserCredential?> signInWithUsernamePassword({
    required String username,
    required String password,
  });
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithFacebook();
}
