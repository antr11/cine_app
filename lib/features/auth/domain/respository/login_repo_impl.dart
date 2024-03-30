import 'package:firebase_auth/firebase_auth.dart';

import '../../data/data_source/auth_remote_datasource.dart';
import '../../data/data_source/auth_remote_datasource.implement.dart';
import 'login_repo.dart';

class NewLoginRepositoryImplement extends NewLoginRepository {
  final NewAuthRemoteDatasource _authDatasoure =
      NewAuthRemoteDatasourceImplement();
  @override
  Future<UserCredential?> signInWithFacebook() {
    // implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithGoogle() {
    //implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithUsernamePassword({
    required String username,
    required String password,
  }) {
    return _authDatasoure.signInWithUsernamePassword(
      username: username,
      password: password,
    );
  }
}
