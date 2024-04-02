import 'package:firebase_auth/firebase_auth.dart';

import '../respository/login_repo.dart';
import '../respository/login_repo_impl.dart';
import 'login_usecases.dart';

class NewLoginUsecasesImplement extends NewLoginUsecases {
  final NewLoginRepository _repo = NewLoginRepositoryImplement();
  @override
  Future<User?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User?> signInWithGoogle() async {
    final UserCredential = await _repo.signInWithGoogle();
    return UserCredential?.user;
  }

  @override
  Future<User?> signInWithUsernamePassword({
    required String username,
    required String password,
  }) async {
    // Make data comtipable with business
    final userCred = await _repo.signInWithUsernamePassword(
      username: username,
      password: password,
    );
    return userCred?.user;
  }
}
