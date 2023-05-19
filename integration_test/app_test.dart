import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:test_farma/main.dart' as app;

void main() {
  late IntegrationTestWidgetsFlutterBinding binding;

  setUpAll(() async {
    binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  });

  tearDownAll(() async {});

  group('end-to-end test', () {
    testWidgets('Ввод пинкода', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      await addDelay(1000);

      await takeScreenshot(tester, binding, name: 'name');

      await addDelay(1000);
    });
  });
}

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

Future<void> takeScreenshot(tester, binding, {required String name}) async {
  if (kIsWeb) {
    await binding.takeScreenshot(name);
    return;
  } else if (Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
  await binding.takeScreenshot(name);
}
