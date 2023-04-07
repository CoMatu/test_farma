import 'package:equatable/equatable.dart';
import 'package:test_farma/common/errors/failure.dart';

class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class InitialSignInState extends SignInState {
  const InitialSignInState();
}

// --- Ждем ввод логина --- //
class LoginWaitSignInState extends SignInState {
  const LoginWaitSignInState();
}

// --- Логин введен --- /
class LoginCompletedSignInState extends SignInState {
  const LoginCompletedSignInState({required String login});
}

// --- Ждем ввод пароля --- //
class PasswordWaitSignInState extends SignInState {
  const PasswordWaitSignInState({required String login});
}

// --- Пароль введен --- //
class PasswordCompletedSignInState extends SignInState {
  const PasswordCompletedSignInState({
    required String login,
    required String password,
  });
}

// --- Отправка запроса на сервер --- //
class ProcessingSignInState extends SignInState {
  const ProcessingSignInState({
    required String login,
    required String password,
  });
}

// --- Сервер ответил 200 --- /
class SuccessSignInState extends SignInState {
  const SuccessSignInState({
    required String login,
    required String password,
  });
}

// --- Ошибка входа или другие --- //
class FailureSignInState extends SignInState {
  const FailureSignInState({
    required String login,
    required String password,
    required Failure failure,
  });
}
