part of 'register_student_cubit.dart';

sealed class RegisterStudentState {}

class InitialRegisterStudentState extends RegisterStudentState {}

class LoadingRegisterStudentState extends RegisterStudentState {}

class SuccessRegisterStudentState extends RegisterStudentState {
  final RegisterEntity registerStudent;
  SuccessRegisterStudentState({required this.registerStudent});
}

class ErrorRegisterStudentState extends RegisterStudentState {
  final String message;
  ErrorRegisterStudentState({required this.message});
}
