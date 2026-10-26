import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  AuthTokenModel({required super.accessToken, required super.refreshToken});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }
}
