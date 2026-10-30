part of 'log_in_cubit.dart';

sealed class LogInState {
  const LogInState();
}

final class InitState extends LogInState {
  const InitState();
}

final class LoadingState extends LogInState {
  const LoadingState();
}

final class SuccessState extends LogInState {
  final AuthTokenEntity token;

  const SuccessState({required this.token});
}

final class ErrorState extends LogInState {
  final String message;

  const ErrorState({required this.message});
}
