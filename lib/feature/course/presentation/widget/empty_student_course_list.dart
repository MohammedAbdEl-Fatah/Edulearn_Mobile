import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/extension.dart';
import '../../../../core/widgets/button.dart';

class EmptyStudentCourseList extends StatefulWidget {
  const EmptyStudentCourseList({super.key});

  @override
  State<EmptyStudentCourseList> createState() => _EmptyStudentCourseListState();
}

class _EmptyStudentCourseListState extends State<EmptyStudentCourseList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 21),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              //All course
              ItemCardSelect(
                title: "All Courses",
                isSelect: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),

              ItemCardSelect(
                title: "Completed Courses",
                isSelect: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),

          // completed Course
          SizedBox(height: context.h(46)),
          //text
          Align(
            alignment: .center,

            child: Container(
              padding: const .all(37),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.all(Radius.circular(22.5)),
              ),
              child: const Icon(
                Icons.chrome_reader_mode_rounded,
                size: 58,
                color: AppColors.primaryDefault,
              ),
            ),
          ),
          SizedBox(height: context.h(32)),
          Text(
            "Your next chapter awaits",
            textAlign: .center,
            style: AppStyle.h1.copyWith(color: AppColors.textDark),
          ),
          SizedBox(height: context.h(8)),
          Text(
            "You haven’t enrolled in a course yet. Find something that sparks your curiosity and start learning.",
            style: AppStyle.caption.copyWith(color: AppColors.textGray),
            textAlign: .center,
          ),
          SizedBox(height: context.h(32)),
          Button(
            title: "Explore courses",
            onPressed: () {
              //todo implement logic
            },
          ),
        ],
      ),
    );
  }
}

class ItemCardSelect extends StatelessWidget {
  const ItemCardSelect({
    super.key,
    required this.isSelect,
    required this.title,
    required this.onTap,
  });

  final bool isSelect;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: isSelect ? AppColors.primaryDefault : AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: AppStyle.body.copyWith(
              color: isSelect ? AppColors.backGroundWhite : AppColors.textDark,
            ),
          ),
        ),
      ),
    );
  }
}
