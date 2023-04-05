import 'package:equatable/equatable.dart';
import 'package:test_farma/src/auth/data/models/user_model.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  const Authenticated(this.userModel);

  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
