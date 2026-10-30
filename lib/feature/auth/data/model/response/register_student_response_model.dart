import 'package:edulearn_mobile/feature/auth/data/model/register_student_model.dart';

class RegisterStudentResponseModel {
  final bool success;
  final String message;
  final RegisterStudentModel registerStudentModel;

  RegisterStudentResponseModel({
    required this.success,
    required this.message,
    required this.registerStudentModel,
  });
  factory RegisterStudentResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterStudentResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      registerStudentModel: RegisterStudentModel.fromJson(json['data']),
    );
  }
}
