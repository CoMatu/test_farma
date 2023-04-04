import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/router/app_router.dart';
import 'package:test_farma/src/landing/controllers/landing_controller.dart';
import 'package:test_farma/src/landing/widgets/app_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static final _drawerKey = GlobalKey<ScaffoldState>();

  static final landingPageController =
      Get.put(LandingPageController(), permanent: false);

  static final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Drawer(),
      body: _NestedNavigator(
        routerDelegate: router.nestedRouterDelegate,
      ),
      bottomNavigationBar: Obx(() {
        return AppBottomBar(
          currentIndex: landingPageController.tabIndex.value,
          onTap: onTap,
        );
      }),
    );
  }

  void onTap(int index) {
    if (index < 2) {
      // change tab index
      landingPageController.changeTabIndex(index);
      // select page
      switch (index) {
        case 0:
          return router.nestedRouterDelegate.beamToNamed('/contacts');
        case 1:
          return router.nestedRouterDelegate.beamToNamed('/favorites');
      }
    } else {
      _drawerKey.currentState?.openDrawer();
    }
  }
}

class _NestedNavigator extends StatelessWidget {
  const _NestedNavigator({
    required this.routerDelegate,
  });

  final BeamerDelegate routerDelegate;

  @override
  Widget build(BuildContext context) {
    return Beamer(
      routerDelegate: routerDelegate,
    );
  }
}
