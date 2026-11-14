import 'package:edulearn_mobile/core/errors/failure.dart';
import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/core/storage/secure_storage.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/refresh_token_entity.dart';

import '../repository/auth_repository.dart';

class RefrehTokenUseCase {
  final AuthRepository _authRepository;

  RefrehTokenUseCase(this._authRepository);

  Future<Result<RefreshTokenEntity>> call() async {
    final role = await SecureStorage().getRole();

    if (role == null) {
      return const Failed(UnauthorizedFailure());
    }
    return await _authRepository.refreshToken(role: role);
  }
}
