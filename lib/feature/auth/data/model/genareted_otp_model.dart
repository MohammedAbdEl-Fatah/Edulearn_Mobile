import 'package:edulearn_mobile/feature/auth/domain/entity/genareted_otp_entity.dart';

class GenaretedOtpModel extends GenaretedOtpEntity {
  final bool success;
  GenaretedOtpModel({required super.message, required this.success});
  factory GenaretedOtpModel.fromJson(Map<String, dynamic> json) {
    return GenaretedOtpModel(
      message: json['message'],
      success: json['success'],
    );
  }
  static Map<String, String> toJson(String email) {
    return {"email": email};
  }
}
