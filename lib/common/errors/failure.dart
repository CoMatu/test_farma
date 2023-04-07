import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ForbiddenFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LogoutFailure extends Failure {
  @override
  List<Object?> get props => [];
}