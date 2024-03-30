import 'package:cine_app/features/auth/login/bloc/login_bloc.dart';
import 'package:cine_app/features/auth/login/login_route.dart';
import 'package:cine_app/features/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(), child: const LoginScreen());
          },
        );
      default:
    }
    return null;
  }
}
