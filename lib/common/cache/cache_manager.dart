import 'package:test_farma/common/cache/cache_model.dart';
import 'package:test_farma/common/database/hive_service.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

abstract class CacheManager {
  Future<bool> writeUserRequestDataWithTime(String key, CacheModel model);
  Future<CacheModel?> getUserRequestDataOnString(String key);
  Future<bool> removeUserRequestSingleCache(String key);
  Future<bool> removeUserRequestCache(String key);
  Future<bool> hasToken();
  Future<void> saveToken(LoginResponse result);
  Future<bool> logout();
}

class CacheManagerImpl implements CacheManager {
  final HiveService _hiveService;

  CacheManagerImpl(HiveService hiveService)
      : _hiveService = hiveService,
        super();

  @override
  Future<CacheModel?> getUserRequestDataOnString(String key) async {
    return await _hiveService.getUserRequestDataOnString(key);
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
      String key, CacheModel model) async {
    return _hiveService.writeUserRequestDataWithTime(key, model);
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

  @override
  Future<bool> logout() async {
    return await _hiveService.deleteToken();
  }
}
