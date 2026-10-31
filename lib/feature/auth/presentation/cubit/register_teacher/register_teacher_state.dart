part of 'register_teacher_cubit.dart';

sealed class RegisterTeacherState {}

final class RegisterTeacherInitial extends RegisterTeacherState {}

final class RegisterTeacherLoading extends RegisterTeacherState {}

final class RegisterTeacherSuccess extends RegisterTeacherState {
  final RegisterEntity registerEntity;
  RegisterTeacherSuccess({required this.registerEntity});
}

final class RegisterTeacherFailure extends RegisterTeacherState {
  final String message;
  RegisterTeacherFailure({required this.message});
}
