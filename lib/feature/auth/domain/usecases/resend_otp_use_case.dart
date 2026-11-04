import '../../../../core/errors/result.dart';
import '../entity/genareted_otp_entity.dart';
import '../repository/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository repository;

  ResendOtpUseCase({required this.repository});

  Future<Result<GenaretedOtpEntity>> call({required String email}) async =>
      await repository.resendOtp(email: email);
}
