import 'package:edulearn_mobile/feature/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../course/presentation/view/course_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';

class LayoutCubit extends Cubit<int> {
  LayoutCubit(super.initialState);
  List<Widget> screen = [
    const HomeScreen(),
    const CourseScreen(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    emit(index);
  }

  void mainPage() {
    emit(0);
  }
}
