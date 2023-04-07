import 'package:flutter/material.dart';

class AppThemeData {
  static const textFieldRadius = BorderRadius.all(Radius.circular(16.0));

  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.orange[700],
    inputDecorationTheme: inputTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.blue[700],
    inputDecorationTheme: inputTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: textFieldRadius,
      ),
    ),
  );

  static const inputTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF94BFFF)),
      borderRadius: textFieldRadius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF94BFFF)),
      borderRadius: textFieldRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF002D70)),
      borderRadius: textFieldRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF0000)),
      borderRadius: textFieldRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF0000)),
      borderRadius: textFieldRadius,
    ),
  );
}
