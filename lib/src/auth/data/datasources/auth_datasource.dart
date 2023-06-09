import 'dart:async';

import 'package:test_farma/common/api/api_service.dart';
import 'package:test_farma/common/cache/cache_manager.dart';
import 'package:test_farma/common/constants/constants.dart';
import 'package:test_farma/src/auth/data/models/login_request.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';

class AuthDatasource {
  final ApiService _apiService;
  final CacheManager _cacheManager;

  AuthDatasource({
    required ApiService apiService,
    required CacheManager cacheManager,
  })  : _apiService = apiService,
        _cacheManager = cacheManager;

  Future<bool> logout() async {
    return await _cacheManager.logout();
  }

  Future<LoginResponse> signIn(LoginRequest loginRequest) async {
    await Future.delayed(mockDuration);
    return await _apiService.login(loginRequest).timeout(httpTimeout);
  }

  Future<bool> hasToken() async {
    return await _cacheManager.hasToken();
  }

  Future<void> saveToken(LoginResponse result) async {
    return await _cacheManager.saveToken(result);
  }
}
