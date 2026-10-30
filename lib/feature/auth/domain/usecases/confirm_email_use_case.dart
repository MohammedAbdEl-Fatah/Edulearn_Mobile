import 'package:edulearn_mobile/feature/auth/domain/entity/otp_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/otp_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/repository/auth_repository.dart';

import '../../../../core/errors/result.dart';

class ConfirmEmailUseCase {
  final AuthRepository repository;

  ConfirmEmailUseCase({required this.repository});

  Future<Result<OtpEntity>> call({required OtpParams params}) {
    return repository.confirmEmail(otpParams: params);
  }
}
