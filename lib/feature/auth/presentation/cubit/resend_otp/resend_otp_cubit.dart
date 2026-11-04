import 'package:edulearn_mobile/feature/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "resend_otp_state.dart";

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this._resendOtpUseCase) : super(InitialResendOtpState());
  final ResendOtpUseCase _resendOtpUseCase;

  void resendOtp({required String email}) {
    emit(LoadingResendOtpState());
    _resendOtpUseCase.call(email: email).then((result) {
      result.fold(
        (failure) => emit(FailureResendOtpState(message: failure.message)),
        (success) => emit(SuccessResendOtpState(message: success.message)),
      );
    });
  }
}
