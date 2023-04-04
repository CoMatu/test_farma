import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:test_farma/common/farma_app.dart';
import 'package:url_strategy/url_strategy.dart';

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
    setPathUrlStrategy();
  }
}
