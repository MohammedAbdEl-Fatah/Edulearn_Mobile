import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';
import 'package:edulearn_mobile/feature/user/domain/repository/user_repository.dart';

import '../datasource/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSourceImpl;

  UserRepositoryImpl(this.remoteDataSourceImpl);

  @override
  Future<Result<UserEntity>> getUser() {
    return remoteDataSourceImpl.getUser();
  }
}
