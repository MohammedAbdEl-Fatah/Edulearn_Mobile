class ValidationField {
  ValidationField();

  static final RegExp _emailRegex = RegExp(r"^[a-zA-Z0-9]{3,}@gmail.com$");
  static final RegExp _passwordRegex = RegExp(
    r"^[a-zA-Z0-9@#]{6,}$",
  ); //include password=> number and letter and shape:@#
  static final RegExp _nameRegex = RegExp(r"^[a-zA-Z]{3,}$");
  static final RegExp _phoneRegex = RegExp(r"^[0-9]{11,}$");
  static final RegExp _dobRegex = RegExp(r"^\d{2}/\d{2}/\d{4}$"); //02/02/2002

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return _passwordRegex.hasMatch(password);
  }

  static bool isValidName(String name) {
    return _nameRegex.hasMatch(name);
  }

  static bool isValidPhone(String phone) {
    return _phoneRegex.hasMatch(phone);
  }

  static bool isValidDob(String dob) {
    return _dobRegex.hasMatch(dob);
  }

  static String? isValidFieldEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    if (!isValidEmail(email)) {
      return "Email is invalid";
    }
    return null;
  }

  static String? isValidFieldPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (!isValidPassword(password)) {
      return "Password is invalid";
    }
    return null;
  }

  static String? isValidFieldConfirmPassword(
    String? confirmPassword,
    String password,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    }
    if (confirmPassword != password) {
      return "Confirm password does not match";
    }
    if (!isValidPassword(confirmPassword)) {
      return "Confirm password is invalid";
    }

    return null;
  }

  static String? isValidFieldName(String? name) {
    if (name == null || name.isEmpty) {
      return "Name is required";
    }
    if (!isValidName(name)) {
      return "Name is invalid";
    }
    return null;
  }

  static String? isValidFieldPhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone is required";
    }
    if (!isValidPhone(phone)) {
      return "Phone is invalid";
    }
    return null;
  }

  static String? isValidFieldDob(String? dob) {
    if (dob == null || dob.isEmpty) {
      return "Date of birth is required";
    }
    if (!_dobRegex.hasMatch(dob)) return "Date of birth is invalid";

    final parts = dob.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    final date = DateTime(year, month, day);

    if (date.day == day &&
        date.month == month &&
        date.year == year &&
        !date.isAfter(DateTime.now())) {
      return null;
    }
    return null;
  }
}
