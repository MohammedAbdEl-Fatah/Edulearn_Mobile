part of 'reset_password_cubit.dart';

sealed class ResetPasswordState {}

class InitialResetPasswordState extends ResetPasswordState {}

class LoadingResetPasswordState extends ResetPasswordState {}

class SuccessResetPasswordState extends ResetPasswordState {
  final String message;
  SuccessResetPasswordState({required this.message});
}

class FailureResetPasswordState extends ResetPasswordState {
  final String message;
  FailureResetPasswordState({required this.message});
}
