import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/src/bottom_navigation/controllers/landing_controller.dart';
import 'package:test_farma/src/bottom_navigation/widgets/app_bottom_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final landingPageController =
        Get.put(LandingPageController(), permanent: false);

    log(landingPageController.tabIndex.value);

    return Scaffold(
      body: const Placeholder(),
      bottomNavigationBar: AppBottomBar(
        currentIndex: landingPageController.tabIndex.value,
        onTap: landingPageController.changeTabIndex,
      ),
    );
  }
}
