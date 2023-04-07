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
  final _state = const SignInState().obs;

  SignInState get state => _state.value;

  String get login => _login.value;
  String get password => _password.value;

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
  }

  void onLoginCompleted() {
    _state.value = PasswordWaitSignInState(login: _login.value);
  }

  void changePassword(String password) {
    _password.value = password;
  }

  Future<void> onPasswordCompleted() async {
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
      (l) => _state.value = FailureSignInState(
          login: _login.value, password: _password.value, failure: l),
      (r) => _state.value = SuccessSignInState(
        login: _login.value,
        password: _password.value,
      ),
    );
  }
}
