part of 'logout_cubit.dart';

sealed class LogoutState {
  const LogoutState();
}

final class LogoutInitial extends LogoutState {
  const LogoutInitial();
}

final class LogoutLoading extends LogoutState {
  const LogoutLoading();
}

final class LogoutSuccess extends LogoutState {
  const LogoutSuccess({required this.message});
  final String message;
}

final class LogoutFailure extends LogoutState {
  const LogoutFailure({required this.message});
  final String message;
}
