import 'package:flutter/material.dart';

class AccountTextField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final String? errorMessage;
  const AccountTextField({
    super.key,
    required this.title,
    this.controller,
    this.errorMessage,
  });

  @override
  State<AccountTextField> createState() => _AccountTextFieldState();
}

class _AccountTextFieldState extends State<AccountTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
        ),
        TextField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          obscuringCharacter: '•',
          decoration: InputDecoration(
            isCollapsed: true,
            errorText: widget.errorMessage,
          ),
        )
      ],
    );
  }
}
