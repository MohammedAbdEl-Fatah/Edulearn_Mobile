
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';

class ItemCardTextFeild extends StatelessWidget {
  const ItemCardTextFeild({
    super.key,
    required this.controller,
    required this.text,
    this.role,
  });
  final String? role;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      color: AppColors.backGroundWhite,

      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(text, style: AppStyle.bodyBold),
              if (role != null)
                Text(
                  "\t - \t${role?[0].toUpperCase()}${role?.substring(1)}",
                  style: AppStyle.bodyBold,
                ),
            ],
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.backGround),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.backGround),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
