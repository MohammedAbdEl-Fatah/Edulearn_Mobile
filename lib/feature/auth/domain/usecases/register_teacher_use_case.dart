import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/repository/auth_repository.dart';

import '../../../../core/errors/result.dart';

class RegisterTeacherUseCase {
  final AuthRepository repository;

  RegisterTeacherUseCase({required this.repository});
  Future<Result<RegisterEntity>> call({
    required RegisterParams registerParams,
  }) async {
    return await repository.registerTeacher(
      registerTeacherParams: registerParams,
    );
  }
}
