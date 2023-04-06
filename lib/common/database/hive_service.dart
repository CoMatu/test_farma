import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();

    /// register adapters
    Hive.registerAdapter(LoginResponseAdapter());

    /// open boxes
    await Hive.openBox('token'); // храним токены jwt & refresh
  }
}
