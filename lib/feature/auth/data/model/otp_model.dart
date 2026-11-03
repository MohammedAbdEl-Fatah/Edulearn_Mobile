import 'package:edulearn_mobile/feature/auth/domain/entity/otp_entity.dart';

class OtpModel extends OtpEntity {
  final bool success;
  OtpModel({required super.message, required this.success});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(message: json['message'], success: json['success']);
  }
}
