abstract class AuthRepository {
  /// авторизован ли пользователь
  Future<bool> getAuthStatus();

  /// вход в приложение
  Future<bool> signIn();

  /// Выход из приложения
  Future<void> logout();
}

class AuthRepositoryImpl with AuthRepository {
  @override
  Future<bool> signIn() async {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> getAuthStatus() async {
    // TODO: implement getAuthStatus
    throw UnimplementedError();
  }
}
