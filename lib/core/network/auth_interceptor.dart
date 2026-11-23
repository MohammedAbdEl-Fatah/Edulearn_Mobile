import 'package:dio/dio.dart';
import 'package:edulearn_mobile/core/network/auth_session_manager.dart';
import 'package:edulearn_mobile/core/network/end_piont_api.dart';
import 'package:edulearn_mobile/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.dio,
    required this.tokenStorage,
    required this.sessionManager,
  });

  final Dio dio;
  final SecureStorage tokenStorage;
  final AuthSessionManager sessionManager;

  bool _isRefreshCall(RequestOptions o) =>
      o.path.endsWith(AuthEndPiontApi.refreshToken);

  bool _isLogoutCall(RequestOptions o) =>
      o.path.endsWith(AuthEndPiontApi.logout);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // The refresh call sets its own headers in the data source.
    if (!_isRefreshCall(options)) {
      final accessToken = await tokenStorage.getAuthToken();
      final refreshToken = await tokenStorage.getRefreshToken();
      final role = await tokenStorage.getRole();
      if (accessToken != null && accessToken.isNotEmpty && role != null) {
        options.headers['accesstoken'] = '$role $accessToken';
        if (refreshToken != null && refreshToken.isNotEmpty) {
          options.headers['Authorization'] = '$role $refreshToken';
        }
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final data = err.response?.data;
    final isExpired =
        err.response?.statusCode == 403 &&
        data is Map &&
        data['message'] == 'Token expired, you need login again';

    final alreadyRetried = err.requestOptions.extra['retried'] == true;

    if (!isExpired ||
        alreadyRetried ||
        _isRefreshCall(err.requestOptions) ||
        _isLogoutCall(err.requestOptions)) {
      return handler.next(err);
    }

    try {
      await sessionManager.refreshSession(); // saves new tokens
    } catch (_) {
      await sessionManager.logoutLocally(); // only a failed refresh logs out
      return handler.next(err);
    }

    try {
      err.requestOptions.extra['retried'] = true;
      // onRequest re-reads the new token from storage
      final retryResponse = await dio.fetch(err.requestOptions);
      return handler.resolve(retryResponse);
    } on DioException catch (e) {
      return handler.next(e); // retry failed, but do NOT log out
    }
  }
}
