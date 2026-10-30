/**
 * "success": true,
    "message": "Successfully Registered, Please verify your email",
    "data": {
        "id": "6ae487ee95910d8186c6e865",
        "Name": "Mohammed abdelfatah",
        "email": "hamo0abdelfatah@gmail.com",
        "dob": "2002-01-01T00:00:00.000Z",
        "phone": "01191428881",
        "role": "student",
        "isVerified": false,
        "createdAt": "2026-10-30T12:05:02.129Z"
    }
 */
class RegisterStudentEntity {
  final String id;
  final String name;
  final String email;
  final String dob;
  final String phone;
  final String role;
  final bool isVerified;
  final String createdAt;

  RegisterStudentEntity({
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
