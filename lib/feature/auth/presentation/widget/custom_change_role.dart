import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/extension.dart';

class CustomChangeRole extends StatelessWidget {
  const CustomChangeRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(12),
        vertical: context.h(7),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        border: Border.all(color: AppColors.primaryTint),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          const Icon(
            Icons.school_rounded,
            size: 14,
            color: AppColors.primaryDefault,
          ),
          SizedBox(width: context.w(6)),
          Text(
            "Student",
            style: AppStyle.smallSemiBold.copyWith(
              color: AppColors.primaryDefault,
            ),
          ),
        ],
      ),
    );
  }
}
