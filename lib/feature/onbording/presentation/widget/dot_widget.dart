import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.currentIndex, required this.count});

  final int currentIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final bool isSelected = index == currentIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSelected ? 26 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryDefault
                    : AppColors.primaryTint,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }),
      ),
    );
  }
}
