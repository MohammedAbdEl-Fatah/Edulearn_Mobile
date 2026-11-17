import 'package:edulearn_mobile/core/errors/result.dart';
import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';
import 'package:edulearn_mobile/feature/profile/domain/params/edit_profile_params.dart';

abstract class RepositoryProfile {
  Future<Result<ProfileEntity>> updateProfile({
    required EditProfileParams params,
  });
}
