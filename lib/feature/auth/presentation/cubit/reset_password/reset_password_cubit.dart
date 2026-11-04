import 'package:edulearn_mobile/feature/auth/domain/params/forgot_password_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "reset_password_state.dart";

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._forgotPasswordUseCase)
    : super(InitialResetPasswordState());
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  void resetPassword({
    required String otp,
    required String email,
    required String password,
  }) {
    emit(LoadingResetPasswordState());
    _forgotPasswordUseCase
        .call(
          params: ForgotPasswordParams(
            otp: otp,
            email: email,
            password: password,
          ),
        )
        .then((result) {
          result.fold(
            (failure) =>
                emit(FailureResetPasswordState(message: failure.message)),
            (success) =>
                emit(SuccessResetPasswordState(message: success.message)),
          );
        });
  }
}
