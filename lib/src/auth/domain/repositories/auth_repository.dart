import 'package:dartz/dartz.dart';
import 'package:test_farma/src/auth/data/datasources/auth_api.dart';
import 'package:test_farma/src/auth/data/models/login_request.dart';
import 'package:test_farma/src/auth/data/models/user_model.dart';

abstract class AuthRepository {
  /// авторизован ли пользователь
  Future<Either<Object, UserModel>> getAuthStatus();

  /// вход в приложение
  Future<Either<Object, UserModel>> signIn(LoginRequest loginRequest);

  /// Выход из приложения
  Future<Either<Object, bool>> logout();
}

class AuthRepositoryImpl with AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(AuthApi authApi) : _authApi = authApi;

  @override
  Future<Either<Object, UserModel>> getAuthStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final UserModel result = await _authApi.getUserFromStorage();

      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Object, bool>> logout() async {
    try {
      final bool result = await _authApi.logout();
      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Object, UserModel>> signIn(LoginRequest loginRequest) async {
    try {
      final UserModel result = await _authApi.signIn(loginRequest);

      return Right(result);
    } catch (e) {
      return Left(e);
    }
  }
}
