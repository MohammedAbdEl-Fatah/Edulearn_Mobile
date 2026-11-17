import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/core/network/end_piont_api.dart';
import 'package:edulearn_mobile/feature/profile/data/datasource/remote_data_source_porfile.dart';
import 'package:edulearn_mobile/feature/profile/data/model/profile_model.dart';

import '../../../../core/network/api_service.dart';

class RemoteDataSourcePorfileImpl implements RemoteDataSourcePorfile {
  final ApiService _apiService;

  RemoteDataSourcePorfileImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<Result<ProfileModel>> editProfile({required params}) {
    return _apiService.patch(
      path: UserEndPoint.editProfile,
      data: ProfileModel.toJson(params),
      parser: (json) => ProfileModel.fromJson(json),
    );
  }
}
