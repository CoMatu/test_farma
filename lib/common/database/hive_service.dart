import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

class HiveService {
  Box? _tokenBox;

  Future<void> init() async {
    await Hive.initFlutter();

    /// register adapters
    Hive.registerAdapter(LoginResponseAdapter());

    /// open boxes
    _tokenBox = await Hive.openBox('token'); // храним токены jwt & refresh
  }

  Future<void> saveToken(LoginResponse response) async {
    await _tokenBox?.put('token', response);
  }

  Future<LoginResponse?> readToken() async {
    return await _tokenBox?.get('token');
  }
}
