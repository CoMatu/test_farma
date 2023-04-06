import 'package:test_farma/common/database/hive_service.dart';

abstract class CacheManager {
  Future<bool> writeUserRequestDataWithTime(
      String key, String model, Duration time);
  Future<String> getUserRequestDataOnString(String key);
  Future<bool> removeUserRequestSingleCache(String key);
  Future<bool> removeUserRequestCache(String key);
  Future<bool> hasToken();
}

class CacheManagerImpl implements CacheManager {
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
    // TODO: implement hasToken
    throw UnimplementedError();
  }
}
