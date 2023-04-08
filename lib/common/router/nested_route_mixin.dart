import 'dart:developer';

import 'package:beamer/beamer.dart';
import 'package:flutter_multitool/constants.dart';
import 'package:get/get.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_state.dart';

import 'app_router.dart';

mixin NestedRouteMixin {
  /// Nested pages
  final nestedRouterDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        SplashLocation(),
        LoginLocation(),
        ContactsLocation(),
        FavoritesLocation(),
        NotFoundLocation(),
      ],
    ),
    buildListener: (context, delegate) {
      log('$commentBgGreen${delegate.configuration.location}');
    },
    guards: [
      BeamGuard(
        pathPatterns: ["/contacts", "/favorites"],
        check: (_, __) {
          log("${commentCyan}routerDelegate | "
              "BeamGuard | check() | is about to retrieve signedIn state");
          return Get.find<AuthController>().state is Authenticated;
        },
        beamToNamed: (origin, target) => AppPages.login.path,
      ),
    ],
  );
}
