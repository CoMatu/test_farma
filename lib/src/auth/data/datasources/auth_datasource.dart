import 'package:test_farma/src/auth/data/models/login_request.dart';
import 'package:test_farma/src/auth/data/models/user_model.dart';

class AuthDatasource {
  Future<UserModel> getUserFromStorage() async {
    throw UnimplementedError();
  }

  Future<bool> logout() async {
    return await Future.delayed(
      const Duration(milliseconds: 1500),
      () => true,
    );
  }

  Future<UserModel> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (loginRequest.login == 'admin' && loginRequest.password == 'admin') {
      return const UserModel(name: 'Admin', surname: 'Adminovich');
    } else {
      throw Exception('Bad credentionals');
    }
  }
}
