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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Drawer(),
      body: _NestedNavigator(
        routerDelegate: nestedRouterDelegate,
      ),
      bottomNavigationBar: AppBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }

  void onTap(int index) {
    if (index < 2) {
      nestedRouterDelegate
          .beamTo(index == 0 ? ContactsLocation() : FavoritesLocation());

      print(nestedRouterDelegate.currentBeamLocation);
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
