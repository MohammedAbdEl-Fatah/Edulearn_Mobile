import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';

class IteamProfile extends StatelessWidget {
  const IteamProfile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.primaryDefault),
      title: Text(title, style: AppStyle.captionSemiBold),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.textMuted),
    );
  }
}
