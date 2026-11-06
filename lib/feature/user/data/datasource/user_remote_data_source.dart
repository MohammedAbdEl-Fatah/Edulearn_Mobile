import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/user/data/model/user_model.dart';

abstract class UserRemoteDataSource {
  UserRemoteDataSource();

  Future<Result<UserModel>> getUser();
}
