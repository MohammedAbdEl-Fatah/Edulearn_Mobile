import 'package:edulearn_mobile/core/storage/key_shared_preferences.dart';
import 'package:edulearn_mobile/core/storage/storage_shared_preferences.dart';
import 'package:edulearn_mobile/feature/onbording/data/on_bording_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(const InitOnbordignState(i: 0));

  final PageController pageController = PageController();
  int get lastIndex => onBordingList.length - 1;

  void onPageChanged(int index) {
    if (index >= lastIndex) {
      emit(FinalOnbordignState(i: index));
      return;
    }
    emit(InitOnbordignState(i: index));
  }

  void nextPage() {
    if (state.i >= lastIndex) return;
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> skip() async {
    await StorageSharedPreferences.storage.set<bool>(
      key: KeySharedPreferences.isWatch.name,
      value: true,
    );
    emit(EndOnbordignState(i: state.i));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
