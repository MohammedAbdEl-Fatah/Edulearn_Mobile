import 'dart:async';

import 'package:edulearn_mobile/core/di/injection_container.dart';
import 'package:edulearn_mobile/core/extensions/string.dart';
import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/otp_params.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/confirm_email/confirm_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/logo.dart';
import '../widget/custom_icon_label.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  final email = "mohammedabdelfatah837@gmail.com";
  final PinInputController _pinController = PinInputController();

  bool get _isOtpComplete => _pinController.text.length == 6;
  Timer? _timer;
  int _remainingSeconds = 300;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _remainingSeconds = 300;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_remainingSeconds <= 1) {
        timer.cancel();
      }

      setState(() {
        _remainingSeconds = _remainingSeconds > 0 ? _remainingSeconds - 1 : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ConfirmEmailCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          leadingWidth: MediaQuery.of(context).size.width * 0.6,
          title: const Logo(),
        ),
        body: Padding(
          padding: const .symmetric(horizontal: 22, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const CustomIconLabel(icon: Icons.mark_email_read_sharp),
                const Text('Check your inbox', style: AppStyle.h1),
                Text(
                  "Enter the 6-digit code we sent to your email to verify your account.",
                  style: AppStyle.caption.copyWith(color: AppColors.textGray),
                ),
                SizedBox(height: context.h(12)),
                Text(email.maskString, style: AppStyle.bodySemiBold),
                //pin
                SizedBox(height: context.h(70)),
                BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
                  builder: (context, state) {
                    final otpStatus = state.otpStatus;
                    return Align(
                      alignment: Alignment.center,
                      child: MaterialPinField(
                        length: 6,
                        pinController: _pinController,
                        onChanged: (value) {
                          _pinController.clearError();
                          context.read<ConfirmEmailCubit>().resetOtpStatus();
                        },
                        theme: MaterialPinTheme(
                          errorColor: AppColors.errorDefault,
                          focusedBorderColor: AppColors.primaryLight,
                          filledBorderColor: AppColors.primaryLight,
                          cursorColor: AppColors.primaryDefault,

                          borderColor: otpStatus == OtpStatus.error
                              ? AppColors.errorDefault
                              : otpStatus == OtpStatus.success
                              ? AppColors.successDefault
                              : AppColors.border,

                          fillColor: AppColors.primaryLight,
                          filledFillColor: AppColors.backGround,
                          focusedFillColor: AppColors.backGroundWhite,
                          shape: MaterialPinShape.outlined,
                          hintCharacter: "-",
                          hintStyle: AppStyle.h1,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: context.h(12)),
                BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
                  builder: (context, state) {
                    if (state is ConfirmEmailSuccess ||
                        state is ConfirmEmailError) {
                      final message = state is ConfirmEmailSuccess
                          ? state.message
                          : (state as ConfirmEmailError).message;
                      final isSuccess = state is ConfirmEmailSuccess;
                      Future.delayed(const Duration(seconds: 2), () {
                        if (isSuccess && context.mounted) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouterName.login,
                            (route) => false,
                          );
                        }
                      });
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSuccess
                              ? AppColors.successDefault.withOpacity(0.1)
                              : AppColors.errorDefault.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSuccess
                                ? AppColors.successDefault
                                : AppColors.errorDefault,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSuccess ? Icons.check_circle : Icons.error,
                              color: isSuccess
                                  ? AppColors.successDefault
                                  : AppColors.errorDefault,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                message,
                                style: AppStyle.body.copyWith(
                                  color: isSuccess
                                      ? AppColors.successDefault
                                      : AppColors.errorDefault,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Text(
                      "The code expires in ${(_remainingSeconds / 60).floor()}:${(_remainingSeconds % 60).toString().padLeft(2, '0')} minutes.",
                      style: AppStyle.caption.copyWith(
                        color: AppColors.textGray,
                      ),
                    );
                  },
                ),
                SizedBox(height: context.h(34)),
                Align(
                  alignment: .center,
                  child: _remainingSeconds > 0
                      ? Text(
                          "Resend code in ${(_remainingSeconds / 60).floor()}:${(_remainingSeconds % 60).toString().padLeft(2, '0')}",
                        )
                      : TextButton(
                          onPressed: () {
                            // Call resend OTP
                          },
                          child: const Text("Resend code"),
                        ),
                ),
                SizedBox(height: context.h(62)),
                BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
                  builder: (context, state) {
                    final isLoading = state is ConfirmEmailLoading;
                    return Button(
                      title: "Verify email",
                      onPressed: _isOtpComplete && !isLoading
                          ? () {
                              context.read<ConfirmEmailCubit>().confirmEmail(
                                OtpParams(
                                  email: email,
                                  otp: _pinController.text,
                                ),
                              );
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
