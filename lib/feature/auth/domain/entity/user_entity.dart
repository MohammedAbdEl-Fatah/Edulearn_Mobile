class UserEntity {
  final String id;
  final String fristName;
  final String lastName;
  final String email;
  final String role;
  final DateTime dob;
  final String? phoneNumber;

  UserEntity({
    required this.id,
    required this.fristName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.dob,
    this.phoneNumber,
  });
}
