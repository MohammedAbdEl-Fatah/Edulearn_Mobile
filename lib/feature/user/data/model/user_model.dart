import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.fullName,
    required super.phone,
    required super.email,
    required super.dob,
    required super.role,
    required super.firstName,
    required super.lastName,
    required super.about,
    required super.stats,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return UserModel(
      fullName: data['fullName'],
      phone: data['phone'],
      email: data['email'],
      dob: data['dob'],
      role: data['role'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      about: data['about'],
      stats: StatsUserInfo(
        courseCount: data['stats']['coursesCount'].toString(),
      ),
    );
  }
}
