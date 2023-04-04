import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:test_farma/common/farma_app.dart';

class Runner {
  static Future<void> run() async {
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
    //..
  }
}
