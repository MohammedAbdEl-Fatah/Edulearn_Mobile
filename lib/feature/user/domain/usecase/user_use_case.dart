import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';
import 'package:edulearn_mobile/feature/user/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository repository;
  UserUseCase({required this.repository});
  Future<Result<UserEntity>> call() {
    return repository.getUser();
  }
}
