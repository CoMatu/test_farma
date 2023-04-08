import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ForbiddenFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LogoutFailure extends Failure {
  @override
  List<Object?> get props => [];
}
