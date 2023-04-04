import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/router/app_router.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_controller.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_state.dart';
import 'package:test_farma/src/auth/presentation/pages/login_page.dart';
import 'package:test_farma/src/landing/widgets/app_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  final _drawerKey = GlobalKey<ScaffoldState>();

  final _beamerKey = GlobalKey<BeamerState>();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Drawer(),
      body: Obx(() {
        print(controller.state.toString());

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: controller.state is Authenticated
              ? Beamer(
                  key: _beamerKey,
                  routerDelegate: nestedRouterDelegate,
                )
              : controller.state is AuthenticationFailure
                  ? Center(
                      child: Text(
                          (controller.state as AuthenticationFailure).message),
                    )
                  : const LoginPage(),
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
