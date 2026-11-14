import 'dart:async';

import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/core/storage/secure_storage.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/refresh_token_entity.dart';

/// A function that calls your refresh endpoint
/// (e.g. RefrehTokenUseCase.call). It is injected so this class does not
/// depend on Dio directly, which avoids a circular dependency:
/// Dio -> AuthInterceptor -> AuthSessionManager -> UseCase -> ... -> Dio
typedef RefreshCall = Future<Result<RefreshTokenEntity>> Function();

class SessionExpiredException implements Exception {
  const SessionExpiredException();

  @override
  String toString() => 'SessionExpiredException: refresh token is invalid';
}

class AuthSessionManager {
  AuthSessionManager({
    required SecureStorage storage,
    required RefreshCall refreshCall,
    required void Function() onSessionExpired,
  }) : _storage = storage,
       _refreshCall = refreshCall,
       _onSessionExpired = onSessionExpired;

  final SecureStorage _storage;
  final RefreshCall _refreshCall;

  /// Called after local logout so AuthCubit can emit `unauthenticated`
  /// and AuthGate switches to LoginScreen.
  final void Function() _onSessionExpired;

  /// Holds the in-flight refresh. If 5 requests get "token expired" at the
  /// same time, only ONE refresh call is sent and all 5 wait for it.
  Future<String>? _ongoingRefresh;

  /// Refreshes the session, saves the new tokens, returns the new access token.
  /// Throws [SessionExpiredException] if the refresh fails.
  Future<String> refreshSession() {
    return _ongoingRefresh ??= _doRefresh().whenComplete(() {
      _ongoingRefresh = null;
    });
  }

  Future<String> _doRefresh() async {
    final result = await _refreshCall();

    // Adjust `fold` if your Result type uses different generics.
    final tokens = result.fold<RefreshTokenEntity?>(
      (failure) => null,
      (success) => success,
    );

    if (tokens == null) throw const SessionExpiredException();

    // IMPORTANT: save BEFORE returning, because the interceptor retries the
    // original request and re-reads the token from storage.
    await _storage.saveTokens(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );

    return tokens.accessToken;
  }

  /// Clears local data and tells the app the user is logged out.
  Future<void> logoutLocally() async {
    await _storage.clearTokes();
    _onSessionExpired();
  }
}
