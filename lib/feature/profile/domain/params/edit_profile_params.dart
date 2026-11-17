import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';

class EditProfileParams extends ProfileEntity {
  EditProfileParams({
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.about,
  });
}
