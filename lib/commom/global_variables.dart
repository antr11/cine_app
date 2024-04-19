import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Globalvariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static HexColor secondaryColor = HexColor('#FF8036');
  static HexColor backgroundColor = HexColor('#1A2232');
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const primaryContainer = Color(0xFF637394);
  static const primary = Color(0xFFFF8036);
  static const onPrimary = Color(0xffffffff);
  static const secondary = Color(0xFF14CC52);
  static const onSecondary = Color(0xffffffff);
  static const background = Color(0xFF1A2232);
  static const onBackground = Color(0xffffffff);
  static const error = Colors.red;
  static const onError = Color(0xffffffff);
  static const surface = Color(0xFF1F293D);
  static const onSurface = Color(0xffffffff);
  static const outline = Color(0x1A6D9EFF);
  static const surfaceVariant = Color(0x001e273a);
  static const surfaceTint = Colors.transparent;

  static const titleLarge =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
  static const titleSmall =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  static const titleMedium =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static const labelLarge =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  static const labelMedium =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);
  static const labelSmall =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white);
  static const bodyLarge = TextStyle(fontSize: 16, color: Colors.white);
  static const bodyMedium = TextStyle(fontSize: 14, color: Colors.white);
  static const bodySmall = TextStyle(fontSize: 12, color: Colors.white);
}

TextTheme _textTheme = const TextTheme().copyWith(
  titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  labelSmall: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
  bodyLarge: const TextStyle(fontSize: 16),
  bodyMedium: const TextStyle(fontSize: 14),
  bodySmall: const TextStyle(fontSize: 12),
);
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: _textTheme,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF8036),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xFF14CC52),
    onSecondary: Color(0xffffffff),
    background: Color(0xFF1A2232),
    onBackground: Color(0xffffffff),
    error: Colors.red,
    onError: Color(0xffffffff),
    surface: Color(0xFF1F293D),
    onSurface: Color(0xffffffff),
    outline: Color(0x1A6D9EFF),
    primaryContainer: Color(0xFF637394),
    surfaceVariant: Color(0x001e273a),
    surfaceTint: Colors.transparent,
  ),
  datePickerTheme: const DatePickerThemeData().copyWith(
    surfaceTintColor: Colors.transparent,
    backgroundColor: const Color(0xFF1A2232),
    // dayForegroundColor: MaterialStateProperty.resolveWith<Color>((states) {
    //   if (states.contains(MaterialState.disabled)) {
    //     return const Color(0x1A6D9EFF);
    //   } else if (states.contains(MaterialState.selected)) {
    //     return const Color(0xFF1A2232);
    //   } else {
    //     return Colors.white;
    //   }
    // }),
  ),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: _textTheme,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF8036),
    onPrimary: Color(0xFF1A2232),
    secondary: Color(0xFF14CC52),
    onSecondary: Color(0xFF1A2232),
    background: Colors.white,
    onBackground: Color(0xFF1A2232),
    error: Colors.red,
    onError: Color(0xFF1A2232),
    surface: Color(0xFFDCDCDC),
    onSurface: Color(0xFF1A2232),
    outline: Color(0x1A6D9EFF),
    primaryContainer: Color(0xFF637394),
    onPrimaryContainer: Color(0xFF1A2232),
    surfaceVariant: Color(0x001e273a),
    surfaceTint: Colors.transparent,
  ),
);
