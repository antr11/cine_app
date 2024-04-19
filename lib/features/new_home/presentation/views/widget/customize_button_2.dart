import 'package:flutter/material.dart';

class CustomizeButton2 extends StatelessWidget {
  Function() onPress;
  TextStyle? textStyle;
  String? text;
  Color? backgroundColor;
  double? borderRadius;
  CustomizeButton2({
    super.key,
    required this.onPress,
    this.textStyle,
    this.text,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? theme.colorScheme.primary,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
      ),
      child: Text(
        text ?? 'Nhập title',
        style: textStyle ??
            TextStyle(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
