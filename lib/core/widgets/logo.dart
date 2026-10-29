import 'package:edulearn_mobile/core/theme/app_images.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9,
      children: [
        Image.asset(AppImages.kLogo),
        const Text("EduLearn", style: AppStyle.h3Bold),
      ],
    );
  }
}
