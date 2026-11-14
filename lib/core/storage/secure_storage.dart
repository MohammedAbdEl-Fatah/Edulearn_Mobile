import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  //instante form object
  SecureStorage._();
  static final SecureStorage storage = SecureStorage._();
  factory SecureStorage() => storage;
  final _storage = const FlutterSecureStorage();
  // Keys
  static const String _authTokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _roleUserKey = 'role_user';
  // Save auth token
  Future<void> _saveAuthToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  //save role USer
  Future<void> _saveRoleUser(String role) async {
    await _storage.write(key: _roleUserKey, value: role);
  }

  // Get auth token
  Future<String?> getAuthToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  // Save refresh token
  Future<void> _saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Get refresh token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Save user ID
  Future<void> _saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // Get user ID
  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }
  
  // Get user role
  Future<String?> getRole() async {
    return await _storage.read(key: _roleUserKey);
  }

  // Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }

  // Logout (clear all data)
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<void> savingInformationUser({
    required String accessToken,
    required String refToken,
    required String idUser,
    required String role,
  }) async {
    await _saveAuthToken(accessToken);
    await _saveRefreshToken(refToken);
    await _saveUserId(idUser);
    await _saveRoleUser(role);
  }
  Future<void>saveTokens({required String accessToken,required String refreshToken})async{
    await _saveAuthToken(accessToken);
    await _saveRefreshToken(refreshToken);
  }

  Future<void> clearTokes() async {
    await _storage.delete(key: _authTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _roleUserKey);
  }
}
