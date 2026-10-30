import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/register_student_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/register_entity.dart';

part 'register_student_state.dart';

class RegisterStudentCubit extends Cubit<RegisterStudentState> {
  RegisterStudentCubit(this.registerStudentUseCase)
    : super(InitialRegisterStudentState());

  final RegisterStudentUseCase registerStudentUseCase;

  Future<void> signUp(RegisterParams pragma) async {
    emit(LoadingRegisterStudentState());
    final result = await registerStudentUseCase.call(model: pragma);
    result.fold(
      (failure) => emit(ErrorRegisterStudentState(message: failure.message)),
      (success) => emit(SuccessRegisterStudentState(registerStudent: success)),
    );
  }
}
