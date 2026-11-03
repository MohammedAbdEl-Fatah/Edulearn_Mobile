part of "confirm_email_cubit.dart";

sealed class ConfirmEmailState {
  OtpStatus get otpStatus;
}

final class ConfirmEmailInitial extends ConfirmEmailState {
  @override
  final OtpStatus otpStatus;
  ConfirmEmailInitial({this.otpStatus = OtpStatus.initial});
}

final class ConfirmEmailLoading extends ConfirmEmailState {
  @override
  final OtpStatus otpStatus;
  ConfirmEmailLoading({this.otpStatus = OtpStatus.initial});
}

final class ConfirmEmailSuccess extends ConfirmEmailState {
  final String message;
  @override
  final OtpStatus otpStatus;
  ConfirmEmailSuccess({
    required this.message,
    this.otpStatus = OtpStatus.success,
  });
}

final class ConfirmEmailError extends ConfirmEmailState {
  final String message;
  @override
  final OtpStatus otpStatus;
  ConfirmEmailError({required this.message, this.otpStatus = OtpStatus.error});
}
