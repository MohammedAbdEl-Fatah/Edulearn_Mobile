class RegisterEntity {
  final String id;
  final String name;
  final String email;
  final String dob;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;

  RegisterEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.dob,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
  });
}
