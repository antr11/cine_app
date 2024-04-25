import 'dart:async';

import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/auth/login/login_route.dart';
import 'package:cine_app/features/new_home/presentation/home_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamed(context, NewHomeRoute.screenName);
      } else {
        Navigator.pushNamed(context, LoginRoute.routeName);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Globalvariables.background,
            Globalvariables.greyBackgroundCOlor
          ],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: [0, 1.0],
          tileMode: TileMode.clamp,
        )),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/app_icon_splash_android.png'),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  "Cinema",
                  textAlign: TextAlign.center,
                  style: Globalvariables.labelLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
