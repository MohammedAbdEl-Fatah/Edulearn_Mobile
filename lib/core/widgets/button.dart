import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.onPressed,
    this.color = AppColors.primaryDefault,
    this.icon,
  });
  final String title;
  final Color? color;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: AppColors.primaryTint,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            //text
            Text(
              title,
              style: AppStyle.captionSemiBold.copyWith(
                color: isDisabled
                    ? AppColors.primaryDefault
                    : AppColors.backGround,
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                size: 18 * 1.5,
                weight: 1,
                color: isDisabled
                    ? AppColors.primaryDefault
                    : AppColors.backGround,
              ),
          ],
        ),
      ),
    );
  }
}
