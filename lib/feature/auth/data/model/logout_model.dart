import '../../domain/entity/logout_entity.dart';

class LogoutModel extends LogoutEntity {
  LogoutModel({required super.success, required super.message});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      success: json['success'].toString(),
      message: json['message'] as String,
    );
  }
}
