import 'package:get/get.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';

import 'auth_state.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl authRepository;
  final _authenticationStateStream = const AuthenticationState().obs;

  AuthController(this.authRepository);

  AuthenticationState get state => _authenticationStateStream.value;

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    _authenticationStateStream.value = AuthenticationLoading();

    final result = await authRepository.signIn();
    _authenticationStateStream.value =
        result ? const Authenticated() : UnAuthenticated();
  }

  void signOut() async {
    _authenticationStateStream.value = AuthenticationLoading();

    await authRepository.logout();
    _authenticationStateStream.value = UnAuthenticated();
  }

  Future<void> _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final result = await authRepository.getAuthStatus();

    result.fold(
      (l) => _authenticationStateStream.value = UnAuthenticated(),
      (r) => _authenticationStateStream.value = Authenticated(r),
    );
  }
}
