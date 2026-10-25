import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../../data/on_bording_model.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required OnBordingModel onBordingModel})
    : _onBordingModel = onBordingModel;
  final OnBordingModel _onBordingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Image.asset(_onBordingModel.image),
        const SizedBox(height: 20),
        Text(
          _onBordingModel.blueText,
          style: AppStyle.smallBold.copyWith(color: AppColors.primaryDefault),
        ),

        Text(
          _onBordingModel.title,
          style: AppStyle.h1,
          textAlign: TextAlign.center,
        ),

        Text(
          _onBordingModel.subTitle,
          style: AppStyle.caption.copyWith(color: AppColors.textGray),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
