import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_farma/common/router/app_router.dart';

import 'theme/app_theme_data.dart';

class FarmaApp extends StatelessWidget {
  const FarmaApp({Key? key}) : super(key: key);

  static final theme = AppThemeData();
  static final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
