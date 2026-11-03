extension StringExtension on String {
  //conver string to maskString
  String get maskString {
    final parts = split("@");
    if (parts.length != 2) return this;

    final username = parts[0];
    final domain = parts[1];

    // Mask username: keep first 2 chars, mask the rest
    final maskedUsername = username.length > 2
        ? username.substring(0, 2) +
              '*' * (username.length - 4) +
              username.substring(username.length - 2, username.length)
        : username;

    return '$maskedUsername@$domain';
  }
}
