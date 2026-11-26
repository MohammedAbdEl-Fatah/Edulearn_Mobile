import 'package:edulearn_mobile/feature/course/presentation/view/my_course_teacher.dart';
import 'package:edulearn_mobile/feature/course/presentation/widget/empty_student_course_list.dart';
import 'package:flutter/material.dart';

import '../widget/custom_app_bar_course.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    // return SafeArea(child: SelectRoleCourse());
    return const SafeArea(child: MyCourseTeacher());
  }
}
