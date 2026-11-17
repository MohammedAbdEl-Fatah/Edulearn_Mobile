import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/profile/data/datasource/remote_data_source_porfile.dart';
import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';
import 'package:edulearn_mobile/feature/profile/domain/params/edit_profile_params.dart';
import 'package:edulearn_mobile/feature/profile/domain/repository/repository_profile.dart';

class ProfileRepositoryImpl implements RepositoryProfile {
  final RemoteDataSourcePorfile _remoteDataSourcePorfile;

  ProfileRepositoryImpl({
    required RemoteDataSourcePorfile remoteDataSourcePorfile,
  }) : _remoteDataSourcePorfile = remoteDataSourcePorfile;

  @override
  Future<Result<ProfileEntity>> updateProfile({
    required EditProfileParams params,
  }) => _remoteDataSourcePorfile.editProfile(params: params);
}
