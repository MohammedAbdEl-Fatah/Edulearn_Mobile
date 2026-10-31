import 'package:edulearn_mobile/feature/auth/domain/entity/register_entity.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';
import 'package:edulearn_mobile/feature/auth/domain/usecases/register_teacher_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_teacher_state.dart';

class RegisterTeacherCubit extends Cubit<RegisterTeacherState> {
  RegisterTeacherCubit(this.registerTeacherUseCase)
    : super(RegisterTeacherInitial());

  final RegisterTeacherUseCase registerTeacherUseCase;

  Future<void> register({required RegisterParams registerParams}) async {
    emit(RegisterTeacherLoading());
    final result = await registerTeacherUseCase.call(
      registerParams: registerParams,
    );
    result.fold(
      (f) => emit(RegisterTeacherFailure(message: f.message)),
      (s) => emit(RegisterTeacherSuccess(registerEntity: s)),
    );
  }
}
