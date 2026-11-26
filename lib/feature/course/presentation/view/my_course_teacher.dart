import 'package:edulearn_mobile/feature/course/presentation/widget/empty_teacher_course_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widget/custom_app_bar_course.dart';

class MyCourseTeacher extends StatelessWidget {
  const MyCourseTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarCourse(),
      body: const EmptyTeacherCourseList(),
      floatingActionButton: FloatingActionButton(
        elevation: 0.8,
        backgroundColor: AppColors.primaryDefault.withAlpha(
          (255 * 0.8).toInt(),
        ),
        shape: const CircleBorder(),
        onPressed: () {
          // navigate to create course
        },
        child: const Icon(Icons.add, color: AppColors.backGroundWhite),
      ),
    );
  }
}
