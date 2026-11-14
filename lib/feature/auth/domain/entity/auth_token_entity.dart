class AuthTokenEntity {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String role;

  AuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.role,
  });
}
