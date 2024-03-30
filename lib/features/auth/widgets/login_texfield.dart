import 'package:cine_app/commom/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../commom/global_variables.dart';

class LoginTextField extends StatefulWidget {
  final String title;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorMessage;
  const LoginTextField({
    super.key,
    required this.title,
    required this.isPassword,
    this.controller,
    this.errorMessage,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late ColorScheme colorScheme;
  bool isHidePassword = true;
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Globalvariables.secondaryColor),
        ),
        TextField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          obscureText: widget.isPassword && isHidePassword,
          obscuringCharacter: '•',
          decoration: InputDecoration(
            errorText: widget.errorMessage,
            isCollapsed: true,
            prefixIcon: Icon(
              widget.isPassword ? Icons.lock : Icons.person,
              color: Globalvariables.secondaryColor,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isHidePassword = !isHidePassword;
                });
              },
              child: _getSuffixIcon(isHidePassword: isHidePassword),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSuffixIcon({required bool isHidePassword}) {
    if (!widget.isPassword) {
      return const SizedBox();
    } else {
      return Icon(
        isHidePassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: colorScheme.primaryContainer,
      );
    }
  }

  Widget _buildSignin({required bool isGoogle}) {
    return SizedBox(
      width: 81,
      height: 81,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // isGoogle ? onGoogleSignin() : onFacebookSignin();
            },
            child: Image.asset(
              isGoogle ? Assets.images.icGGSignIn : Assets.images.icFBSignIn,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            isGoogle ? 'Google' : 'Facebook',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
