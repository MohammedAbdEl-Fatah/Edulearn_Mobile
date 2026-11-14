import 'package:edulearn_mobile/feature/auth/domain/entity/refresh_token_entity.dart';

class RefreshTokenModel extends RefreshTokenEntity {
  RefreshTokenModel({required super.accessToken, required super.refreshToken});
  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    final token = json['token'] as Map<String, dynamic>;
    return RefreshTokenModel(
      accessToken: token['accessToken'],
      refreshToken: token['refreshToken'],
    );
  }
}
