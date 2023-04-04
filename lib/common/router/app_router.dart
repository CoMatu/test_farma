import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_farma/src/bottom_navigation/page/landing_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return GetPageRoute(
          routeName: '/',
          page: () => const LandingPage(),
        );
      default:
        return GetPageRoute(
          routeName: '/',
          page: () => const LandingPage(),
        );
    }
  }
}
