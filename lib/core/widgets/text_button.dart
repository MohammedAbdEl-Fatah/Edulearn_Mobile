import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyle.captionSemiBold.copyWith(
          color: AppColors.primaryDefault,
        ),
      ),
    );
  }
}
