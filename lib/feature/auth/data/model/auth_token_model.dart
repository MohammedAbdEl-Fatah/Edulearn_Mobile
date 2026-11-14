import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  AuthTokenModel({
    required super.accessToken,
    required super.refreshToken,
    required super.userId,
    required super.role,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as String,
      role: json['role'] as String,
    );
  }
}
