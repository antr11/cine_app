// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginState {}

class InitialLoginState extends LoginState {
  String? message;
}

class SuccessLoginState extends LoginState {
  String? message;
  SuccessLoginState({this.message});
}

class FailLoginState extends LoginState {
  String? message;
  bool? isWrongPassword;
  bool? isWrongUsername;
  FailLoginState({
    this.message,
    this.isWrongPassword,
    this.isWrongUsername,
  });
}

class LoadingLoginState extends LoginState {
  LoadingLoginState();
}

class FailThirdLoginState extends LoginState {
  String? message;
  FailThirdLoginState({
    this.message,
  });
}
