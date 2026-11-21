import 'package:edulearn_mobile/feature/profile/domain/entity/profile_entity.dart';
import 'package:edulearn_mobile/feature/profile/domain/usecase/edit_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/params/edit_profile_params.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.editProfileUseCase})
    : super(IntializeEditProfileState());
  final EditProfileUseCase editProfileUseCase;
  Future<void> editProfile({required EditProfileParams params}) async {
    emit(LoadingEditProfileState());
    await editProfileUseCase
        .call(params: params)
        .then(
          (value) => value.fold(
            (f) => emit(FailureEditProfileState(message: f.message)),
            (s) => emit(SuccessEditProfileState(profileEntity: s)),
          ),
        );
  }
}
