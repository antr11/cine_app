import 'package:firebase_auth/firebase_auth.dart';

import 'auth_remote_datasource.dart';

class NewAuthRemoteDatasourceImplement extends NewAuthRemoteDatasource {
  @override
  Future<UserCredential?> signInWithFacebook() {
    // implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithGoogle() {
    //  implement signInWithGoogle
    throw UnimplementedError();
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
