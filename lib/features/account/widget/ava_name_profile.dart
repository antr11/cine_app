import 'package:cine_app/commom/global_variables.dart';
import 'package:cine_app/features/account/account_screen.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                'https://media-cdn-v2.laodong.vn/storage/newsportal/2024/3/18/1316511/Han-So-Hee-3-01.jpg')),
        const SizedBox(
          height: 10,
        ),
        Text(
          userinfor.name,
          style: Globalvariables.bodyMedium,
        ),
      ],
    );
  }
}
