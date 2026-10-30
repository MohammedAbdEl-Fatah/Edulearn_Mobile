import 'package:edulearn_mobile/feature/auth/domain/entity/register_student_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_student.dart';
import 'package:edulearn_mobile/feature/auth/domain/repository/auth_repository.dart';

import '../../../../core/errors/result.dart';

class RegisterStudentUseCase {
  final AuthRepository repository;
  RegisterStudentUseCase({required this.repository});
  Future<Result<RegisterStudentEntity>> call({
    required RegisterStudentParams model,
  }) {
    return repository.registerStudent(registerStudentParams: model);
  }
}
