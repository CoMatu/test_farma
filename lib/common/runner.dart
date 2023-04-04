import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/farma_app.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_controller.dart';
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

    // init auth controller
    Get.lazyPut(() => AuthController(AuthRepositoryImpl()));
  }
}
