import 'dart:async';

import 'package:cine_app/features/auth/domain/usecases/login_usecases.dart';
import 'package:cine_app/features/auth/domain/usecases/login_usecases.implement.dart';
import 'package:cine_app/features/auth/login/bloc/login_event.dart';
import 'package:cine_app/features/auth/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginUsernamPasswordEvent>(_onUsernamePasswordEvent);
    on<LoginThirdPartyEvent>(_onThirdPartyLoginEvent);
  }
  final NewLoginUsecases _usecases = NewLoginUsecasesImplement();
  FutureOr<void> _onUsernamePasswordEvent(
    LoginUsernamPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingLoginState());
    try {
      // Mock server call
      // await Future.delayed(const Duration(seconds: 2));
      final user = await _usecases.signInWithUsernamePassword(
        username: event.username.trim(),
        password: event.password.trim(),
      );
      if (user != null) {
        emit(
          SuccessLoginState(
            message: 'Signin success with email name is ${user.email}',
          ),
        );
      } else {
        emit(FailLoginState(message: 'Không tìm thấy tài khoản'));
      }
    } catch (e) {
      emit(FailLoginState(message: e.toString()));
    }

    return null;
    // emit(LoadingLoginState());
    // await Future.delayed(const Duration(seconds: 2));
    // if (event.username.isNotEmpty && event.password.isNotEmpty) {
    //   emit(SuccessLoginState());
    // } else {
    //   if (event.username.isEmpty) {
    //     emit(
    //       FailLoginState(
    //           message: "vui lòng đăng nhập lại tên đăng nhập",
    //           isWrongUsername: true),
    //     );
    //   } else if (event.password.isEmpty) {
    //     emit(
    //       FailLoginState(
    //           message: "vui lòng đăng nhập lại mat khau",
    //           isWrongPassword: true),
    //     );
    //   } else {
    //     emit(FailLoginState(message: "undefined error"));
    //   }
    // }
    // return null;
  }

  FutureOr<void> _onThirdPartyLoginEvent(
    LoginThirdPartyEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingLoginState());
    if (event.isGoogle) {
      // Sign with Google
      try {
        final user = await _usecases.signInWithGoogle();
        if (user == null) {
          emit(
            FailThirdLoginState(
              message: '''User not found''',
            ),
          );
        } else {
          emit(
            SuccessLoginState(
              message: 'Signin success with email name is ${user.email}',
            ),
          );
        }
      } catch (e) {
        emit(
          FailThirdLoginState(
            message: e.toString(),
          ),
        );
      }
    }
  }
}
