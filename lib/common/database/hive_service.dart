import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();
  }
}
