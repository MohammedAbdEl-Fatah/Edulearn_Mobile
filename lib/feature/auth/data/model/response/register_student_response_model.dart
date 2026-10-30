import 'package:edulearn_mobile/feature/auth/data/model/register_student_model.dart';

class RegisterResponseModel {
  final bool success;
  final String message;
  final RegisterModel registerModel;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.registerModel,
  });
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      registerModel: RegisterModel.fromJson(json['data']),
    );
  }
}
