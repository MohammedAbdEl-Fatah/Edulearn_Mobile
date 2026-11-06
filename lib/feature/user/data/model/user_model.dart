import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.fullName,
    required super.phone,
    required super.email,
    required super.dob,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      phone: json['phone'],
      email: json['email'],
      dob: json['dob'],
      role: json['role'],
    );
  }
}
