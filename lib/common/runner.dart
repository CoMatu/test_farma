import 'dart:async';
import 'dart:developer';

import 'package:beamer/beamer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/di/app_binding.dart';
import 'package:test_farma/common/farma_app.dart';

class Runner {
  static Future<void> run() async {
    await initializeApp();

    runZonedGuarded<void>(
      () {
        runApp(const FarmaApp());
      },
      (error, stackTrace) {
        //...
        log('ERROR: $error');
      },
    );
  }

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    // удалить # из url
    Beamer.setPathUrlStrategy();

    /// Фиксируем портретный режим
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await AppBinding().dependencies();
  }
}
