import 'package:get/get.dart';
import 'package:test_farma/src/auth/data/models/login_request.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';
import 'package:test_farma/src/auth/presentation/controllers/sign_in/signin_state.dart';

class SignInController extends GetxController {
  final AuthRepository _authRepository;

  SignInController(AuthRepository authRepository)
      : _authRepository = authRepository;

  final _login = ''.obs;
  final _password = ''.obs;
  final _errorText = Rxn<String>();

  final _state = const SignInState().obs;

  SignInState get state => _state.value;

  String get login => _login.value;
  String get password => _password.value;
  String? get error => _errorText.value;

  /// validators
  bool get loginIsValid => _login.value.isNotEmpty;
  bool get passwordIsValid => _password.value.isNotEmpty;

  @override
  void onInit() {
    _state.value = const InitialSignInState();
    super.onInit();
  }

  void changeLogin(String login) {
    _login.value = login;
    if (login.isNotEmpty) {
      _errorText.value = null;
    }
  }

  void onLoginCompleted() {
    if (loginIsValid) {
      _state.value = PasswordWaitSignInState(login: _login.value);
    } else {
      _errorText.value = 'Поле обязательно для заполнения';
    }
  }

  void changePassword(String password) {
    _password.value = password;
    if (password.isNotEmpty) {
      _errorText.value = null;
    }
  }

  Future<void> onPasswordCompleted() async {
    if (passwordIsValid) {
      _state.value = ProcessingSignInState(
        login: _login.value,
        password: _password.value,
      );

      final result = await _authRepository.signIn(
        LoginRequest(
          login: _login.value,
          password: _password.value,
        ),
      );

      result.fold(
        (l) {
          _state.value = FailureSignInState(
              login: _login.value, password: _password.value, failure: l);
          _errorText.value = 'Доступ запрещен, проверьте логин или пароль';
        },
        (r) => _state.value = SuccessSignInState(
          login: _login.value,
          password: _password.value,
        ),
      );
    } else {
      _errorText.value = 'Поле обязательно для заполнения';
    }
  }

  void backToLogin() {
    _state.value = LoginCompletedSignInState(login: login);
  }
}
