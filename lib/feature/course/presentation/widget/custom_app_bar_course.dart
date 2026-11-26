import 'package:flutter/material.dart';

import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/extension.dart';

class CustomAppBarCourse extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(AppImages.kLogo),
          SizedBox(width: context.w(10)),
          const Text("My Courses", style: AppStyle.h3Bold),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
