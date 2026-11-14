import 'package:edulearn_mobile/core/storage/secure_storage.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/auth_session_manager.dart';

class AuthCubit extends Cubit<AuthStatus> {
  AuthCubit(this._sessionManager, this._storage) : super(AuthStatus.initial);

  final AuthSessionManager _sessionManager;
  final SecureStorage _storage;

  Future<void> checkAuthState() async {
    emit(AuthStatus.checking);
    final refreshToken = await _storage.getRefreshToken();
    final role = await _storage.getRole();
    if (refreshToken == null ||
        refreshToken.isEmpty ||
        role == null ||
        role.isEmpty) {
      await _storage.clearTokes();
      emit(AuthStatus.unauthenticated);
      return;
    }
    try {
      await _sessionManager.refreshSession();
      emit(AuthStatus.authenticated);
    } catch (_) {
      await _storage.clearTokes();
      emit(AuthStatus.unauthenticated);
    }
  }

  void sessionExpired() => emit(AuthStatus.unauthenticated);
}
