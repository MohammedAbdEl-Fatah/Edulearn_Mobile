import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/logo.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: MediaQuery.of(context).size.width * 0.6,
        title: const Logo(),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryTint,
              border: Border.all(color: AppColors.primaryTint),
            ),
            child: Icon(Icons.mark_email_read_outlined),
          ),
        ],
      ),
    );
  }
}
