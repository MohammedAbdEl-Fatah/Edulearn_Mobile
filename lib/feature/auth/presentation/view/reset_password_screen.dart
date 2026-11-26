import 'package:edulearn_mobile/core/di/injection_container.dart';
import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:edulearn_mobile/feature/auth/domain/validation_field.dart';
import 'package:edulearn_mobile/feature/auth/presentation/widget/custom_icon_label.dart';
import 'package:edulearn_mobile/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/logo.dart';
import '../cubit/reset_password/reset_password_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _controllerNewPassword = TextEditingController();

  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    _controllerNewPassword.dispose();
    _controllerConfirmPassword.dispose();
    _key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email =
        (ModalRoute.of(context)?.settings.arguments
            as Map<String, String>)["email"]!;
    final otp =
        (ModalRoute.of(context)?.settings.arguments
            as Map<String, String>)["otp"]!;

    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: const Row(children: [Spacer(), Logo()])),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 24,
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomIconLabel(icon: Icons.password_rounded),
                  const Text("Set a new password", style: AppStyle.h1),
                  Text(
                    "Choose a strong new password you haven't used before.",
                    style: AppStyle.body.copyWith(color: AppColors.textGray),
                  ),
                  CustomTextFormField(
                    hintText: "Enter your new password",
                    header: "New Password",
                    controller: _controllerNewPassword,
                    isObscure: true,
                    validator: (p0) => ValidationField.isValidFieldPassword(p0),
                  ),
                  CustomTextFormField(
                    hintText: "Confirm your new password",
                    header: "Confirm New Password",
                    controller: _controllerConfirmPassword,
                    isObscure: true,
                    validator: (p0) =>
                        ValidationField.isValidFieldConfirmPassword(
                          p0,
                          _controllerNewPassword.text,
                        ),
                  ),
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    builder: (context, state) {
                      return state is SuccessResetPasswordState
                          ? Container(
                              padding: EdgeInsets.all(context.w(16)),
                              decoration: BoxDecoration(
                                color: AppColors.successLight,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: AppColors.successDefault,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    state.message,
                                    style: AppStyle.small.copyWith(
                                      color: AppColors.successDefault,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : state is FailureResetPasswordState
                          ? Container(
                              padding: EdgeInsets.all(context.w(16)),
                              decoration: BoxDecoration(
                                color: AppColors.errorLight,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: AppColors.errorDefault,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    state.message,
                                    style: AppStyle.small.copyWith(
                                      color: AppColors.errorDefault,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  const Spacer(),
                  Align(
                    alignment: .bottomEnd,
                    child: Button(
                      title: "Save new password",
                      onPressed: () {
                        if (!_key.currentState!.validate()) return;
                        context.read<ResetPasswordCubit>().resetPassword(
                          otp: otp,
                          email: email,
                          password: _controllerNewPassword.text,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
