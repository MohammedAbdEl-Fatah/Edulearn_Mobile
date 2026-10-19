import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

//common failure types
class NoInternetFailure extends Failure {
  const NoInternetFailure({super.message = "No internet connection"});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = "The request took too long. Please try again.",
  });
}

//4xx -client errors
///400 - Bad Request
class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = "Bad request"});
}

///401 - Unauthorized
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = "Pls login again"});
}

///403 - Forbidden
class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    super.message = "You are not authorized to access this resource.",
  });
}

///404 - Not Found
class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = "The requested item was not found."});
}

//custom error form servier anther error 4xx
final class ClientFailure extends Failure {
  const ClientFailure({required super.message, this.statusCode});

  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

//5xx -server errors
final class ServerFailure extends Failure {
  const ServerFailure({
    super.message = "Something went wrong on our side. Please try again later.",
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

//unknown error
final class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = "Something went wrong. Please try again.",
  });
}
