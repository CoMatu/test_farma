import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/router/app_router.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_state.dart';
import 'package:test_farma/src/landing/widgets/app_bottom_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _drawerKey = GlobalKey<ScaffoldState>();

  final _beamerKey = GlobalKey<BeamerState>();

  final controller = Get.find<AuthController>();

  @override
  void initState() {
    controller.stateStream.listen(stateListener);
    super.initState();
  }

  void stateListener(AuthenticationState state) {
    /// слушаем контроллер и меняем пейджи
    if (state is Authenticated) {
      _beamerKey.currentState?.routerDelegate
          .beamToNamed(AppPages.contacts.path);
    }
    if (state is UnAuthenticated) {
      _beamerKey.currentState?.routerDelegate.beamToNamed(AppPages.login.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Drawer(),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: nestedRouterDelegate,
      ),
      bottomNavigationBar: AppBottomBar(
        beamerKey: _beamerKey,
        onShowDrawer: () {
          _drawerKey.currentState?.openDrawer();
        },
      ),
    );
  }
}
