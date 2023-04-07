import 'package:dartz/dartz.dart';
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
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(AuthDatasource authDatasource)
      : _authDatasource = authDatasource;

  @override
  Future<Either<Failure, bool>> getAuthStatus() async {
    await Future.delayed(mockDuration);

    try {
      final result = await _authDatasource.hasToken();

      return Right(result);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final bool result = await _authDatasource.logout();
      return Right(result);
    } catch (e) {
      return Left(LogoutFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(LoginRequest loginRequest) async {
    try {
      final result = await _authDatasource.signIn(loginRequest);

      if (result.jwt.isNotEmpty) {
        // TODO: Save token to DB
        // Matusevich Vyacheslav <Telegram: @CoMatu>, 07 April 2023

        await _authDatasource.saveToken(result);
        return const Right(true);
      } else {
        return Left(ForbiddenFailure());
      }
    } on Exception {
      return Left(ForbiddenFailure());
    }
  }
}
