import "package:edulearn_mobile/core/theme/app_style.dart";
import "package:edulearn_mobile/core/theme/extension.dart";
import "package:edulearn_mobile/core/widgets/button.dart";
import "package:flutter/material.dart";

import "../../../../core/router/app_router.dart";
import "../../../../core/theme/app_colors.dart";

class EmptyTeacherCourseList extends StatelessWidget {
  const EmptyTeacherCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 21),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: context.h(46)),
          //text
          Align(
            alignment: .center,

            child: Container(
              padding: .all(37),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.all(Radius.circular(22.5)),
              ),
              child: const Icon(
                Icons.live_tv,
                size: 58,
                color: AppColors.primaryDefault,
              ),
            ),
          ),
          SizedBox(height: context.h(32)),
          Text(
            "Share what you know",
            textAlign: .center,
            style: AppStyle.h1.copyWith(color: AppColors.textDark),
          ),
          SizedBox(height: context.h(8)),
          Text(
            "Your first course can make a real difference. Start with a title, then bring your lessons to life.",
            style: AppStyle.caption.copyWith(color: AppColors.textGray),
            textAlign: .center,
          ),
          SizedBox(height: context.h(32)),
          Button(
            title: "Create your first course",
            onPressed: () {
              Navigator.pushNamed(context, RouterName.createCourse);
            },
          ),
        ],
      ),
    );
  }
}
