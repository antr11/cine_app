import 'package:cine_app/features/auth/login/login_screen.dart';
import 'package:cine_app/features/movie_details/movie_detail_route.dart';
import 'package:cine_app/features/movie_details/movie_detail_screen.dart';
import 'package:cine_app/features/new_home/presentation/new_home_route.dart';
import 'package:cine_app/features/new_home/presentation/views/new_home_screen.dart';
import 'package:cine_app/features/ticket/domain/entites/ticket_entity.dart';
import 'package:cine_app/features/ticket/new_ticket_screen.dart';
import 'package:cine_app/features/ticket/ticket_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/login/bloc/login_bloc.dart';
import 'features/auth/login/login_route.dart';
import 'features/movie_details/bloc/movie_detail_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case NewHomeRoute.screenName:
        return MaterialPageRoute(
          builder: (context) {
            return const NewHomeScreen();
          },
        );
      case LoginRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(), //
              child: const LoginScreen(),
            );
          },
        );
      case NewMovieDetailRoute.routeName:
        final args = settings.arguments as List<dynamic>;
        final id = args.first as int?;
        if (id == null) {
          return null;
        }
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => NewMovieDetailBloc(),
              child: NewMovieDetailScreen(
                movieId: id.toString(),
              ),
            );
          },
        );
      case NewTicketRoute.routeName:
        final ticketEntity = settings.arguments as NewTicketEntity;
        return MaterialPageRoute(
          builder: (context) {
            return NewTicketScreen(ticket: ticketEntity);
          },
        );
      default:
    }
    return null;
  }
}
