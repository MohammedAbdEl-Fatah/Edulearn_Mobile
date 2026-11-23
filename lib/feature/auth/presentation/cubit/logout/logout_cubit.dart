import 'package:edulearn_mobile/feature/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/storage/secure_storage.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logoutUseCase) : super(const LogoutInitial());
  final LogoutUseCase _logoutUseCase;

  Future<void> logout() async {
    emit(const LogoutLoading());
    final result = await _logoutUseCase.call();
    await result.fold(
      (failure) async => emit(LogoutFailure(message: failure.message)),
      (entity) async {
        await SecureStorage().clearTokes();
       
        emit(LogoutSuccess(message: entity.message));
      },
    );
  }
}
