import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';
import 'package:edulearn_mobile/feature/profile/domain/params/edit_profile_params.dart';

class ProfileModel extends ProfileEntity {
  final String id;
  final String fullName;
  final String dob;
  final String role;
  final String email;

  ProfileModel({
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.about,
    required this.id,
    required this.fullName,
    required this.dob,
    required this.role,
    required this.email,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final mainData = json["data"];
    return ProfileModel(
      id: mainData['id'],
      fullName: mainData['fullName'],
      firstName: mainData['firstName'],
      lastName: mainData['lastName'],
      email: mainData['email'],
      phone: mainData['phone'],
      about: mainData['about'],
      dob: mainData['dob'],
      role: mainData['role'],
    );
  }
  static Map<String, String> toJson(EditProfileParams params) {
    return {
      "firstName": params.firstName,
      "lastName": params.lastName,
      "phone": params.phone,
      "about": params.about,
    };
  }
}
