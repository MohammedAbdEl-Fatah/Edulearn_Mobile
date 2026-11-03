import 'package:edulearn_mobile/feature/auth/domain/params/otp_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/confirm_email_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_email_state.dart';

enum OtpStatus { initial, success, error }

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit(this._confirmEmailUseCase) : super(ConfirmEmailInitial());
  final ConfirmEmailUseCase _confirmEmailUseCase;

  //call request confirm
  Future<void> confirmEmail(OtpParams otpParams) async {
    emit(ConfirmEmailLoading(otpStatus: OtpStatus.initial));
    final result = await _confirmEmailUseCase(params: otpParams);
    result.fold(
      (failure) => emit(
        ConfirmEmailError(message: failure.message, otpStatus: OtpStatus.error),
      ),
      (success) => emit(
        ConfirmEmailSuccess(
          message: success.message,
          otpStatus: OtpStatus.success,
        ),
      ),
    );
  }

  void resetOtpStatus() {
    emit(ConfirmEmailInitial(otpStatus: OtpStatus.initial));
  }
}
