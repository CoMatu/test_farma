import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_farma/common/router/app_router.dart';
import 'package:test_farma/src/landing/widgets/app_bottom_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _drawerKey = GlobalKey<ScaffoldState>();

  final _beamerKey = GlobalKey<BeamerState>();

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
