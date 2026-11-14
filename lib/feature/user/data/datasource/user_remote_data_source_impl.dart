import 'package:edulearn_mobile/core/network/api_service.dart';
import 'package:edulearn_mobile/core/network/end_piont_api.dart';
import 'package:edulearn_mobile/feature/user/data/datasource/user_remote_data_source.dart';

import '../../../../core/errors/result.dart';
import '../model/user_model.dart';

//todo get role user
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  final ApiService _apiService;
  @override
  Future<Result<UserModel>> getUser() async {  return _apiService.get(
      path: UserEndPoint.profileUser,
      parser: (json) => UserModel.fromJson(json),
    );
  }
}
