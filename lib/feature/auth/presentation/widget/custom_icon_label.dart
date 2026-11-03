import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomIconLabel extends StatelessWidget {
  const CustomIconLabel({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .center,
      child: Container(
        padding: const .all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryTint,
          borderRadius: BorderRadius.circular(22.5),
          border: Border.all(color: AppColors.primaryTint),
        ),
        child: Icon(icon, size: 32 * 4, color: AppColors.primaryDefault),
      ),
    );
  }
}
