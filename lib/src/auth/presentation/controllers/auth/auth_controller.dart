import 'package:get/get.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';

import 'auth_state.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  final _authenticationStateStream = const AuthenticationState().obs;

  AuthController(AuthRepository authRepository)
      : _authRepository = authRepository;

  AuthenticationState get state => _authenticationStateStream.value;

  Rx<AuthenticationState> get stateStream => _authenticationStateStream;

  Future<void> signInSuccess() async {
    _authenticationStateStream.value = Authenticated();
  }

  void logout() async {
    _authenticationStateStream.value = AuthenticationLoading();

    await _authRepository.logout();
    _authenticationStateStream.value = UnAuthenticated();
  }

  Future<void> getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final result = await _authRepository.getAuthStatus();

    result.fold(
      (l) => _authenticationStateStream.value = UnAuthenticated(),
      (r) => _authenticationStateStream.value =
          r ? Authenticated() : UnAuthenticated(),
    );
  }
}
