part of 'user_cubit.dart';

sealed class UserState {}

class InitUserState extends UserState {}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {
  final UserEntity userEntity;

  SuccessUserState({required this.userEntity});
}

//never state because if it was failuer mean no user login
class FailedUserState extends UserState {}
