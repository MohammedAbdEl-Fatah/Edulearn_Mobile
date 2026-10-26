import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_button.dart';
import '../widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: MediaQuery.of(context).size.width * 0.6,
        title: Logo(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .symmetric(horizontal: 24, vertical: 22.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "A LITTLE CLOSER TO YOUR GOALS",
                style: AppStyle.smallBold.copyWith(
                  color: AppColors.primaryDefault,
                ),
              ),
              SizedBox(height: context.h(10)),
              Text("Welcome back", style: AppStyle.h1),
              SizedBox(height: context.h(10)),
              Text(
                "Log in and pick up where your curiosity left off.",
                style: AppStyle.caption.copyWith(color: AppColors.textGray),
              ),
              SizedBox(height: context.h(28)),
              //custom textform field email
              CustomTextFormField(
                hintText: 'you@example.com',
                header: 'Email address',
                controller: _controllerEmail,
                isObscure: false,
              ),
              SizedBox(height: context.h(20)),
              CustomTextFormField(
                hintText: 'Enter your password',
                header: 'Password',
                controller: _controllerPassword,
                isObscure: true,
              ),
              SizedBox(height: context.h(20)),
              Align(
                alignment: .centerEnd,
                child: CustomTextButton(
                  onPressed: () {},
                  title: "Forgot password?",
                ),
              ),

              SizedBox(height: context.h(28)),
              //message login
              Container(
                padding: EdgeInsets.all(context.w(16)),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
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
              SizedBox(height: context.h(103)),
              Button(
                onPressed: () {
                  //todo implement login
                },
                title: "Login",
              ),
              SizedBox(height: context.h(12)),
              Align(
                alignment: .center,
                child: CustomTextButton(
                  onPressed: () {},
                  title: "New to EduLearn? Create an account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
