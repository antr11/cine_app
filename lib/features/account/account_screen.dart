import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cine_app/commom/constants/app_constant.dart';
import 'package:cine_app/commom/constants/custom_button.dart';
import 'package:cine_app/commom/emuns/gender.dart';
import 'package:cine_app/features/account/bloc/account_bloc.dart';
import 'package:cine_app/features/account/bloc/account_event.dart';
import 'package:cine_app/features/account/bloc/account_state.dart';
import 'package:cine_app/features/account/change_infor/change_infor_route.dart';
import 'package:cine_app/features/account/data/domain/entities/account_entity.dart';
import 'package:cine_app/features/account/widget/ava_name_profile.dart';
import 'package:cine_app/features/account/widget/information_profile.dart';
import 'package:cine_app/features/account/widget/setting_account.dart';
import 'package:cine_app/features/auth/login/login_route.dart';
import 'package:cine_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:svg_flutter/svg.dart';
import 'package:uuid/uuid.dart';

import '../../commom/constants/assets.dart';
import 'package:cine_app/commom/global_variables.dart';
import '../../commom/emuns/bloc_status.dart';

import '../../commom/ultis/localizations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountBloc get bloc => BlocProvider.of<AccountBloc>(context);

  @override
  void initState() {
    super.initState();
    // UserId
    var userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      bloc.add(GetAccountInfoEvent(userId: userId));
      print(userId);

      account = AccountEntity(id: userId);
    }
  }

  AccountEntity? account;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.status == BlocStatusState.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        if (state.status == BlocStatusState.success) {
          print(account);
          if (state.successMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).inform,
              message: state.successMessage,
            );
            // toast
          }
        } else if (state.status == BlocStatusState.failed) {
          if (state.errorMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).error,
              message: state.errorMessage,
            );
            // toast
          }
        }
      },
      builder: (context, state) {
        account = state.account;
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
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginRoute.routeName, (route) => false);
                },
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AvatarWidget(
                    name: account?.fullName,
                    avatarUrl: account?.avatarUrl,
                  ),
                  InformationWidget(
                    name: account?.fullName,
                    phone: account?.phoneNumber,
                    email: account?.email,
                    city: account?.city,
                    gender: account?.gender.toString(),
                    birthday: account?.dateOfBirth,
                  ),
                  const SettingAccountWidget(),
                  CustomButton(
                      text: "Edit",
                      onTap: () {
                        Navigator.pushNamed(
                            context, ChangeInforRoute.routeName);
                      },
                      color: Globalvariables.selectedNavBarColor)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
