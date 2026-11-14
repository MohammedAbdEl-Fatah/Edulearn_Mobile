class UserEntity {
  final String fullName;
  final String firstName;
  final String lastName;
  final String about;
  final String phone;
  final String email;
  final String dob;
  final String role;
  final StatsUserInfo stats;

  UserEntity({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.stats,
  });
}
class StatsUserInfo{
  final String courseCount;
  
  StatsUserInfo({
    required this.courseCount,
  });
}
