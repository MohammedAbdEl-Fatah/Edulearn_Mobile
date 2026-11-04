class ForgotPasswordParams {
  final String otp;
  final String email;
  final String password;

  ForgotPasswordParams({
    required this.otp,
    required this.email,
    required this.password,
  });
}
