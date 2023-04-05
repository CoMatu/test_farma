import 'dart:developer';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multitool/constants.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/router/app_router.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_controller.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_state.dart';
import 'package:test_farma/src/landing/widgets/app_bottom_bar.dart';

class LandingPage extends GetView<AuthController> {
  LandingPage({Key? key}) : super(key: key);

  final _drawerKey = GlobalKey<ScaffoldState>();

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Drawer(),
      body: Obx(() {
        log('$commentGreen${controller.state.toString()}');

        /// слушаем контроллер и меняем пейджи
        if (controller.state is Authenticated) {
          _beamerKey.currentState?.routerDelegate
              .beamToNamed(AppPages.contacts.path);
        } else if (controller.state is UnAuthenticated) {
          _beamerKey.currentState?.routerDelegate
              .beamToNamed(AppPages.login.path);
        }

        return Beamer(
          key: _beamerKey,
          routerDelegate: nestedRouterDelegate,
        );
      }),
      bottomNavigationBar: AppBottomBar(
        beamerKey: _beamerKey,
        onShowDrawer: () {
          _drawerKey.currentState?.openDrawer();
        },
      ),
    );
  }
}
