import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Result<UserEntity>> getUser();
}
