abstract class LoginEvent {}

class LoginUsernamPasswordEvent extends LoginEvent {
  String username;
  String password;
  LoginUsernamPasswordEvent({
    required this.username,
    required this.password,
  });
}

class LoginThirdPartyEvent extends LoginEvent {
  bool isGoogle;

  LoginThirdPartyEvent({required this.isGoogle});
}
