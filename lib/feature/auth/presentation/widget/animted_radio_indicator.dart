
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AnimatedRadioIndicator extends StatelessWidget {
  final bool isSelected;

  const AnimatedRadioIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primaryDefault : Colors.grey.shade300,
          width: isSelected ? 7 : 2,
        ),
      ),
    );
  }
}
