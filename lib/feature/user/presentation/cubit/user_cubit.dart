import 'package:edulearn_mobile/feature/user/domain/entity/user_entity.dart';
import 'package:edulearn_mobile/feature/user/domain/usecase/user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(super.initialState, this.useCase);
  final UserUseCase useCase;
  Future<void> getUser() async {
    emit(LoadingUserState());
    await useCase.call().then((value) {
      value.fold(
        (failure) {
          emit(FailedUserState());
        },
        (user) {
          emit(SuccessUserState(userEntity: user));
        },
      );
    });
  }
}
