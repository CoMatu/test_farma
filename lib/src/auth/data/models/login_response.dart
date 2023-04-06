import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_response.g.dart';

@HiveType(typeId: 1)
class LoginResponse extends Equatable {
  @HiveField(0)
  final String jwt;
  @HiveField(1)
  final String refresh;
  @HiveField(2)
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
