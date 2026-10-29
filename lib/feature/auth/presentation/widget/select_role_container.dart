import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:flutter/material.dart';

import 'animted_radio_indicator.dart';

class SelectRoleContainer extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;
  final IconData icon;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const SelectRoleContainer({
    super.key,
    required this.title,
    required this.description,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight : AppColors.backGround,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primaryDefault : AppColors.backGround,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onChanged(value),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: context.w(40),
                    height: context.h(40),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryDefault
                          : AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      size: 24,
                      color: isSelected
                          ? AppColors.backGround
                          : AppColors.primaryDefault,
                    ),
                  ),
                  SizedBox(width: context.w(12)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(title, style: AppStyle.h3Bold)],
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimatedRadioIndicator(isSelected: isSelected),
                ],
              ),
              SizedBox(height: context.h(16)),
              Text(subtitle, style: AppStyle.captionSemiBold),
              Text(description, style: AppStyle.small),
            ],
          ),
        ),
      ),
    );
  }
}
