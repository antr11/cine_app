import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_remote_datasource.dart';

class NewAuthRemoteDatasourceImplement extends NewAuthRemoteDatasource {
  @override
  Future<UserCredential?> signInWithFacebook() {
    // implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    //  implement signInWithGoogle
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception('Google Account not found');
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  @override
  Future<UserCredential?> signInWithUsernamePassword({
    required String username,
    required String password,
  }) async {
    final userCred = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
    return userCred;
  }
}
