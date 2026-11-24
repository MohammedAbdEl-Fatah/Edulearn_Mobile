import 'package:edulearn_mobile/core/theme/app_images.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:flutter/material.dart';

import '../widget/empty_course_list.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(AppImages.kLogo),
              SizedBox(width: context.w(10)),
              const Text("My Courses", style: AppStyle.h3Bold),
            ],
          ),
        ),
        body: const EmptyCourseList(),
      ),
    );
  }
}
