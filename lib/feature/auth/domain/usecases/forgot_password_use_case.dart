import '../../../../core/errors/result.dart';
import '../entity/forgot_password_entity.dart';
import '../params/forgot_password_params.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<Result<ForgotPasswordEntity>> call({
    required ForgotPasswordParams params,
  }) async =>
      await repository.forgotPassword(params: params);
}
