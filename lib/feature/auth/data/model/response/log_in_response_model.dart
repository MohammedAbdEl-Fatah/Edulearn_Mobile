import '../auth_token_model.dart';

class LogInResponseModel {
  final bool success;
  final String message;
  final AuthTokenModel token;

  LogInResponseModel({
    required this.token,
    required this.message,
    required this.success,
  });

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) {
    return LogInResponseModel(
      token: AuthTokenModel.fromJson(json['data']),
      message: json['message'],
      success: json['success'] as bool,
    );
  }
}
