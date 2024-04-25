import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cine_app/commom/constants/assets.dart';
import 'package:cine_app/commom/constants/custom_button.dart';
import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:cine_app/features/auth/login/bloc/login_bloc.dart';
import 'package:cine_app/features/auth/login/bloc/login_event.dart';
import 'package:cine_app/features/auth/login/bloc/login_state.dart';
import 'package:cine_app/features/auth/register/register_screen.dart';
import 'package:cine_app/features/auth/widgets/login_texfield.dart';
import 'package:cine_app/features/new_home/presentation/home_route.dart';
import 'package:cine_app/features/new_home/presentation/views/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:svg_flutter/svg.dart';

import '../../../commom/ultis/localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscured = false;
// final bloc = BlocProvider.of<LoginBloc>(context);
  LoginBloc get bloc => BlocProvider.of(context);
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context,
      {String? usernameError, String? passwordError}) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    late LoginState state;

    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is SuccessLoginState) {
        showOkAlertDialog(
            context: context, message: translate(context).loginSuccess);
        Navigator.pushNamed(context, NewHomeRoute.screenName);
      } else if (state is FailLoginState) {
        showOkAlertDialog(context: context, message: state.message);
      } else if (state is FailThirdLoginState) {
        showOkAlertDialog(context: context, message: state.message);
      }
    }, builder: (BuildContext context, state) {
      final isusernameError =
          state is FailLoginState ? state.isWrongUsername : false;
      final ispasswordError =
          state is FailLoginState ? state.isWrongPassword : false;
      final errorMessage = state is FailLoginState ? state.message : null;

      return Scaffold(
        backgroundColor: const Color.fromRGBO(26, 34, 50, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(
                    Assets.svg.icAppIcon,
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginTextField(
                          controller: emailController,
                          title: translate(context).login,
                          isPassword: false,
                          errorMessage: usernameError,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LoginTextField(
                          controller: passwordController,
                          title: translate(context).password,
                          isPassword: true,
                          errorMessage: passwordError,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Globalvariables.secondaryColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          text: "Login",
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (c) => const AccountScreen(),
                            //   ),
                            // );
                            final event = LoginUsernamPasswordEvent(
                              username: emailController.text,
                              password: passwordController.text,
                            );
                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            loginBloc.add(event);
                          },
                          color: Globalvariables.secondaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Or sign in with",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                otherSignin(true),
                                const SizedBox(
                                  width: 20,
                                ),
                                otherSignin(false),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Row otherSignin(isGoogle) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            isGoogle ? onGoogleSignin() : onFacebookSignin();
          },
          child: Image.asset(
            isGoogle ? Assets.images.icGGSignIn : Assets.images.icFBSignIn,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

extension _LoginScreenAction on _LoginScreenState {
  void onFacebookSignin() {
    if (kDebugMode) {
      print('On Facebook login');
      bloc.add(LoginThirdPartyEvent(isGoogle: false));
    }
  }

  void onGoogleSignin() {
    if (kDebugMode) {
      print('On Google login');
      bloc.add(LoginThirdPartyEvent(isGoogle: true));
    }
  }
}
