class LogInRequestModel {
  final String email;
  final String password;

  LogInRequestModel({required this.email, required this.password});

  Map<String, String> toJson() {
    return {"email": email, "password": password};
  }
}
