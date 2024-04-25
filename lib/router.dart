import 'package:cine_app/features/account/account_route.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:cine_app/features/account/bloc/account_bloc.dart';
import 'package:cine_app/features/account/change_infor/change_infor_route.dart';
import 'package:cine_app/features/account/change_infor/change_infor_screen.dart';
import 'package:cine_app/features/auth/login/login_screen.dart';
import 'package:cine_app/features/movie_details/movie_detail_route.dart';
import 'package:cine_app/features/movie_details/movie_detail_screen.dart';
import 'package:cine_app/features/new_home/presentation/bloc/home_bloc.dart';
import 'package:cine_app/features/new_home/presentation/home_route.dart';
import 'package:cine_app/features/new_home/presentation/views/home_screen.dart';
import 'package:cine_app/features/ticket/bloc/new_ticket_bloc.dart';
import 'package:cine_app/features/ticket/domain/entites/ticket_entity.dart';
import 'package:cine_app/features/ticket/new_ticket_screen.dart';
import 'package:cine_app/features/ticket/ticket_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'features/auth/login/bloc/login_bloc.dart';
import 'features/auth/login/login_route.dart';
import 'features/movie_details/bloc/movie_detail_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case NewHomeRoute.screenName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => HomeBloc(),
              child: const NewHomeScreen(),
            );
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
        final ticketEntity = settings.arguments as TicketEntity;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => NewTicketBloc(),
              child: NewTicketScreen(ticket: ticketEntity),
            );
          },
        );
      case AccountRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AccountBloc(),
              child: const AccountScreen(),
            );
          },
        );
      case ChangeInforRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AccountBloc(),
              child: ChangeInforScreen(),
            );
          },
        );
      default:
    }
    return null;
  }
}
