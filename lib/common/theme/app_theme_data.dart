import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.red, brightness: Brightness.dark),
  );

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
  );
}
