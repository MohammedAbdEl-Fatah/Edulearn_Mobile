import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';
import 'package:edulearn_mobile/feature/profile/domain/params/edit_profile_params.dart';
import 'package:edulearn_mobile/feature/profile/domain/repository/repository_profile.dart';

class EditProfileUseCase {
  EditProfileUseCase({required this.repositoryProfile});

  final RepositoryProfile repositoryProfile;
  Future<Result<ProfileEntity>> call({required EditProfileParams params}) {
    return repositoryProfile.updateProfile(params: params);
  }
}
