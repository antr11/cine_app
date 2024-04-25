import 'package:cine_app/commom/bloc/app_bloc/app_bloc.dart';
import 'package:cine_app/commom/bloc/app_bloc/app_state.dart';

import 'package:cine_app/commom/service/dio_client.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:cine_app/features/account/bloc/account_bloc.dart';
import 'package:cine_app/features/account/change_infor/change_infor_screen.dart';
import 'package:cine_app/features/auth/login/bloc/login_bloc.dart';
import 'package:cine_app/features/auth/login/login_screen.dart';
import 'package:cine_app/features/new_home/presentation/bloc/home_bloc.dart';
import 'package:cine_app/router.dart';
import 'package:cine_app/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'commom/theme_data.dart';
import 'features/new_home/presentation/views/home_screen.dart';
import 'features/ticket/data/local/new_ticket_local_datasource.dart';
import 'features/ticket/data/local/new_ticket_local_datasource_sqf_implement.dart';
import 'firebase_options.dart';
import 'l10n/generated/app_localizations.dart';

DioClient dioClient = DioClient();
NewTicketLocalDatasource newTicketDatasource =
    NewTicketLocalDatasourceSqfImplement();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
  dioClient.initDio();
  newTicketDatasource.initDB();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MediaQuery(
        data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.dark,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale ?? const Locale('en'),
              onGenerateRoute: RouteGenerator.generate,
              builder: EasyLoading.init(),
              // home: const AccountScreen(),
              // home: BlocProvider(
              //   create: (context) => AccountBloc(),
              //   child: const AccountScreen(),
              // ),
              // home: BlocProvider(
              //   create: (context) => AccountBloc(),
              //   child: ChangeInforScreen(),
              // ),
              // home: BlocProvider(
              //   create: (context) => HomeBloc(),
              //   child: const NewHomeScreen(),
              // ),
              // home: BlocProvider(
              //   create: (context) => LoginBloc(),
              //   child: const LoginScreen(),
              // ),
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false;
}
