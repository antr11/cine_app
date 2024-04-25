// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_screen.dart';

import '../data/domain/entities/account_entity.dart';

class AvatarWidget extends StatefulWidget {
  final String? avatarUrl;
  final String? name;
  const AvatarWidget({
    this.avatarUrl,
    this.name,
    super.key,
    // this.currentAccount,
  });

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

AccountEntity? accountState; //

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage("${widget.avatarUrl}"),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${widget.name}",
          style: Globalvariables.bodyMedium,
        ),
      ],
    );
  }
}
