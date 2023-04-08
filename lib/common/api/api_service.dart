import 'dart:convert';
import 'dart:developer';

import 'package:test_farma/common/constants/constants.dart';
import 'package:test_farma/common/errors/exceptions.dart';
import 'package:test_farma/src/auth/data/models/login_request.dart';
import 'package:test_farma/src/auth/data/models/login_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final success =
        loginRequest.login == 'admin' && loginRequest.password == 'admin';
    if (success) {
      return Future.value(
        const LoginResponse(
          jwt: 'jwt',
          refresh: 'refresh',
          expiredIn: 7200,
        ),
      );
    } else {
      throw ForbiddenException();
    }
  }

  Future<Map<String, dynamic>> getContacts() async {
    final response = await http.get(Uri.parse(jsonUrl));
    log(response.toString());
    return jsonDecode(response.body);
  }
}
