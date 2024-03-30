import 'package:cine_app/features/account/widget/ava_name_profile.dart';
import 'package:cine_app/features/account/widget/information_profile.dart';
import 'package:cine_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../commom/constants/assets.dart';
import 'package:cine_app/commom/global_variables.dart';
import '../../commom/theme_data.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

final userinfor = User(
    name: 'Han so hee',
    email: 'nholkey@gmai.com',
    password: 'password',
    address: '158 nguyen van thuong',
    phone: '0923456789');

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // late ThemeData _themeData;
  // TextTheme get _textTheme => _themeData.textTheme;
  // ColorScheme get _colorScheme => _themeData.colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globalvariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Globalvariables.backgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: Globalvariables.primaryContainer,
            size: 32,
          ),
        ),
        title: const Text(
          'Profile',
          style: Globalvariables.titleLarge,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                Assets.svg.icLogout,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              AvatarWidget(),
              InformationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
