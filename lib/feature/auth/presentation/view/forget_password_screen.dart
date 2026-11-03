import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:edulearn_mobile/feature/auth/domain/validation_field.dart';
import 'package:edulearn_mobile/feature/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/text_button.dart';
import '../widget/custom_icon_label.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Row(children: [Spacer(), Logo()])),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomIconLabel(icon: Icons.lock_outline_rounded),
              const Text("Forgot your password?", style: AppStyle.h1),
              SizedBox(height: context.h(8)),
              Text(
                "No worries. Enter your account email and we'll help you reset it.",
                style: AppStyle.bodySemiBold.copyWith(
                  color: AppColors.textGray,
                ),
              ),
              SizedBox(height: context.h(34)),
              Form(
                key: _key,
                child: CustomTextFormField(
                  hintText: "user@example.com",
                  header: "Email adress",
                  controller: _controller,
                  isObscure: false,
                  validator: (p0) => ValidationField.isValidFieldEmail(p0),
                ),
              ),
              SizedBox(height: context.h(12)),
              Container(
                padding: EdgeInsets.all(context.w(16)),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.verified_user_outlined,
                      color: AppColors.primaryDefault,
                    ),
                    SizedBox(width: context.w(12)),
                    Text(
                      "One account for your learning or teaching journey.",
                      style: AppStyle.small.copyWith(color: AppColors.textGray),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h(16)),
              Button(
                title: "Send Reset Code",
                onPressed: () {
                  //todo useacase resend otp
                },
              ),
              Align(
                alignment: Alignment.center,
                child: CustomTextButton(
                  title: "Back to Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
