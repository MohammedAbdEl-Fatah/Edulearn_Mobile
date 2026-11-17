import 'package:edulearn_mobile/feature/profile/data/model/profile_model.dart';
import 'package:edulearn_mobile/feature/profile/domain/params/edit_profile_params.dart';

import '../../../../core/errors/result.dart';

abstract class RemoteDataSourcePorfile {
  Future<Result<ProfileModel>> editProfile({required EditProfileParams params});
}
