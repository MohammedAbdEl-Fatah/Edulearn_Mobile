
part of "edit_profile_cubit.dart";


sealed class EditProfileState {}

class IntializeEditProfileState extends EditProfileState {}

class LoadingEditProfileState extends EditProfileState {}

class SuccessEditProfileState extends EditProfileState {
  final ProfileEntity profileEntity;

  SuccessEditProfileState({required this.profileEntity});
}

class FailureEditProfileState extends EditProfileState {
  final String message;

  FailureEditProfileState({required this.message});
}
