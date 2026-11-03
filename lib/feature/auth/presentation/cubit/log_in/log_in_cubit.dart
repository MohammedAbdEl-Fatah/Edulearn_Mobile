
import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/log_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/storage/secure_storage.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._logInUseCase) : super(const InitState());
  final LogInUseCase _logInUseCase;

  Future<void> login(LoginParams params) async {
    emit(const LoadingState());
    final result = await _logInUseCase.call(model: params);
    result.fold((failure) => emit(ErrorState(message: failure.message)), (
      token,
    ) async {
      final secureStorage = SecureStorage();
      await secureStorage.saveAuthToken(token.accessToken);
      await secureStorage.saveRefreshToken(token.refreshToken);
      emit(SuccessState(token: token));
    });
  }
}
