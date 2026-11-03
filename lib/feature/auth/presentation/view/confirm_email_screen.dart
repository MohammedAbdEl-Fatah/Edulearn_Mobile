import 'dart:async';

import 'package:edulearn_mobile/core/extensions/string.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/logo.dart';

enum OtpStatus { initial, success, error }

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  final email = "mohammedabdelfatah@gmail.com";
  OtpStatus otpStatus = OtpStatus.initial;
  final PinInputController _pinController = PinInputController();

  bool get _isOtpComplete => _pinController.text.length == 6;
  Timer? _timer;
  int _remainingSeconds = 600;

  void verifyOtp(bool? isSuccess) {
    setState(() {
      otpStatus = isSuccess == null
          ? OtpStatus.initial
          : (isSuccess ? OtpStatus.success : OtpStatus.error);
    });
  }

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
      _remainingSeconds = 600;
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
    return Scaffold(
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
              Align(
                alignment: .center,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryTint,
                    borderRadius: BorderRadius.circular(22.5),
                    border: Border.all(color: AppColors.primaryTint),
                  ),
                  child: const Icon(
                    Icons.mark_email_read_sharp,
                    size: 32 * 4,
                    color: AppColors.primaryDefault,
                  ),
                ),
              ),
              const Text('Check your inbox', style: AppStyle.h1),
              Text(
                "Enter the 6-digit code we sent to your email to verify your account.",
                style: AppStyle.caption.copyWith(color: AppColors.textGray),
              ),
              SizedBox(height: context.h(12)),
              Text(email.maskString, style: AppStyle.bodySemiBold),
              //pin
              SizedBox(height: context.h(70)),
              MaterialPinField(
                length: 6,
                pinController: _pinController,
                onChanged: (value) {
                  _pinController.clearError();
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
              SizedBox(height: context.h(12)),
              Text(
                "The code expires in ${(_remainingSeconds / 60).floor()}:${(_remainingSeconds % 60).toString().padLeft(2, '0')} minutes.",
                style: AppStyle.caption.copyWith(color: AppColors.textGray),
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
              Button(
                title: "Verify email",
                onPressed: _isOtpComplete
                    ? () {
                        // print(_pinController.text);
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
