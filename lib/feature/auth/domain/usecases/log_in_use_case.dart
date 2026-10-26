import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/auth/domain/entity/auth_token_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/log_in_params.dart';

import '../repository/auth_repository.dart';

class LogInUseCase {
  final AuthRepository repository;
  LogInUseCase({required this.repository});

  Future<Result<AuthTokenEntity>> call({required LoginParams model}) {
    return repository.login(loginModel: model);
  }
}
