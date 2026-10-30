import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/repository/auth_repository.dart';

import '../../../../core/errors/result.dart';

class RegisterStudentUseCase {
  final AuthRepository repository;
  RegisterStudentUseCase({required this.repository});
  Future<Result<RegisterEntity>> call({required RegisterParams model}) {
    return repository.registerStudent(registerStudentParams: model);
  }
}
