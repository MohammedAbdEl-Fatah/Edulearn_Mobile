import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/extension.dart';

class CustomDetailsCourseItem extends StatelessWidget {
  const CustomDetailsCourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.backGroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: .min,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: Image.asset(AppImages.kLearningIllustration0, fit: .cover),
            ),
            SizedBox(width: context.w(6)),
            const Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text("Name of course"),
                Text("Name of Teacher"),
                Text("count of lession and - level"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
