import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_farma/common/router/app_router.dart';

import 'theme/app_theme_data.dart';

class FarmaApp extends StatelessWidget {
  const FarmaApp({Key? key}) : super(key: key);

  static final theme = AppThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
