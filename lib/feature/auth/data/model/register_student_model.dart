import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.dob,
    required super.role,
    required super.isVerified,
    required super.createdAt,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      dob: json['dob'] as String,
      role: json['role'] as String,
      isVerified: json['isVerified'] as bool,
      createdAt: json['createdAt'] as String,
    );
  }
}
