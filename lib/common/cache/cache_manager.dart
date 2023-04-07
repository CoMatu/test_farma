import 'package:test_farma/common/database/hive_service.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

abstract class CacheManager {
  Future<bool> writeUserRequestDataWithTime(
      String key, String model, Duration time);
  Future<String> getUserRequestDataOnString(String key);
  Future<bool> removeUserRequestSingleCache(String key);
  Future<bool> removeUserRequestCache(String key);
  Future<bool> hasToken();
  Future<void> saveToken(LoginResponse result);
}

class CacheManagerImpl implements CacheManager {
  final HiveService _hiveService;

  CacheManagerImpl(HiveService hiveService)
      : _hiveService = hiveService,
        super();

  @override
  Future<String> getUserRequestDataOnString(String key) async {
    // TODO: implement getUserRequestDataOnString
    throw UnimplementedError();
  }

  @override
  Future<bool> removeUserRequestCache(String key) async {
    // TODO: implement removeUserRequestCache
    throw UnimplementedError();
  }

  @override
  Future<bool> removeUserRequestSingleCache(String key) async {
    // TODO: implement removeUserRequestSingleCache
    throw UnimplementedError();
  }

  @override
  Future<bool> writeUserRequestDataWithTime(
      String key, String model, Duration time) async {
    // TODO: implement writeUserRequestDataWithTime
    throw UnimplementedError();
  }

  @override
  Future<bool> hasToken() async {
    final result = await _hiveService.readToken();

    /// упрощенная проверка
    return result != null;
  }

  @override
  Future<void> saveToken(LoginResponse result) async {
    return await _hiveService.saveToken(result);
  }
}
