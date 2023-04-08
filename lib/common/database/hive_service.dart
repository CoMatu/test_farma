import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_farma/common/cache/cache_model.dart';
import 'package:test_farma/common/constants/constants.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

class HiveService {
  Box? _tokenBox;
  Box? _cacheBox;

  Future<void> init() async {
    await Hive.initFlutter();

    /// register adapters
    Hive.registerAdapter(LoginResponseAdapter());
    Hive.registerAdapter(CacheModelAdapter());

    /// open boxes
    _tokenBox = await Hive.openBox(tokenKey); // храним токены jwt & refresh
    _cacheBox = await Hive.openBox(cacheKey);
  }

  Future<void> saveToken(LoginResponse response) async {
    await _tokenBox?.put('token', response);
  }

  Future<LoginResponse?> readToken() async {
    return await _tokenBox?.get('token');
  }

  Future<bool> deleteToken() async {
    await _tokenBox?.deleteAll(['token']);
    return true;
  }

  Future<bool> writeUserRequestDataWithTime(
      String key, CacheModel model) async {
    await _cacheBox?.put(key, model);
    return true;
  }

  Future<CacheModel?> getUserRequestDataOnString(String key) async {
    final result = await _cacheBox?.get(key);
    return result;
  }

  Future<bool> deleteAll() async {
    await Hive.deleteFromDisk();
    return true;
  }
}
