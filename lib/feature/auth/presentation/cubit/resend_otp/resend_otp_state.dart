part of 'resend_otp_cubit.dart';

sealed class ResendOtpState {}

class InitialResendOtpState extends ResendOtpState {}

class LoadingResendOtpState extends ResendOtpState {}

class SuccessResendOtpState extends ResendOtpState {
  final String message;
  SuccessResendOtpState({required this.message});
}

class FailureResendOtpState extends ResendOtpState {
  final String message;
  FailureResendOtpState({required this.message});
}
