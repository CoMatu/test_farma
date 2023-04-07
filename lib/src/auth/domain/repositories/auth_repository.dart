import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_farma/common/constants/constants.dart';
import 'package:test_farma/common/errors/failure.dart';
import 'package:test_farma/src/auth/data/datasources/auth_datasource.dart';
import 'package:test_farma/src/auth/data/models/login_request.dart';

abstract class AuthRepository {
  /// авторизован ли пользователь
  Future<Either<Failure, bool>> getAuthStatus();

  /// вход в приложение
  Future<Either<Failure, bool>> signIn(LoginRequest loginRequest);

  /// Выход из приложения
  Future<Either<Failure, bool>> logout();
}

class AuthRepositoryImpl with AuthRepository {
  final AuthDatasource _authApi;

  AuthRepositoryImpl(AuthDatasource authApi) : _authApi = authApi;

  @override
  Future<Either<Failure, bool>> getAuthStatus() async {
    await Future.delayed(mockDuration);

    var tokens = Hive.box('token');

    return Right(tokens.isNotEmpty);
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final bool result = await _authApi.logout();
      return Right(result);
    } catch (e) {
      return Left(LogoutFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(LoginRequest loginRequest) async {
    final result = await _authApi.signIn(loginRequest);

    if (result.jwt.isNotEmpty) {
      return const Right(true);
    } else {
      return Left(ForbiddenFailure());
    }
  }
}
