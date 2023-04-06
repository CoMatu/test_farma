import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String jwt;
  final String refresh;
  final int expiredIn;

  const LoginResponse({
    required this.jwt,
    required this.refresh,
    required this.expiredIn,
  });

  @override
  List<Object?> get props => [jwt, refresh, expiredIn];

  @override
  String toString() {
    return 'LoginResponse(\njwt: $jwt,\nrefresh: $refresh,\nexpiredIn: $expiredIn)';
  }
}
