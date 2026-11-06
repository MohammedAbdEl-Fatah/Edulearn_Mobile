import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/logo.dart';
import 'package:edulearn_mobile/feature/auth/domain/validation_field.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/log_in/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/text_button.dart';
import '../../../user/presentation/cubit/user_cubit.dart';
import '../../domain/params/log_in_params.dart';
import '../widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LogInCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          leadingWidth: MediaQuery.of(context).size.width * 0.6,
          title: const Logo(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .symmetric(horizontal: 24, vertical: 22.0),
            child: Form(
              key: _formKey,
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
                  const Text("Welcome back", style: AppStyle.h1),
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
                    validator: (value) =>
                        ValidationField.isValidFieldEmail(value),
                  ),
                  SizedBox(height: context.h(20)),
                  CustomTextFormField(
                    hintText: 'Enter your password',
                    header: 'Password',
                    controller: _controllerPassword,
                    isObscure: true,
                    validator: (value) =>
                        ValidationField.isValidFieldPassword(value),
                  ),
                  SizedBox(height: context.h(20)),
                  Align(
                    alignment: .centerEnd,
                    child: CustomTextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouterName.forgotPasswordScreen,
                        );
                      },
                      title: "Forgot password?",
                    ),
                  ),

                  SizedBox(height: context.h(28)),

                  //message login
                  BlocConsumer<LogInCubit, LogInState>(
                    listener: (context, state) {
                      if (state is SuccessState) {
                        context.read<UserCubit>().getUser();
                        // 1.5sec waitting
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouterName.home,
                              (route) => false,
                            );
                          }
                        });
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(context.w(16)),
                            decoration: BoxDecoration(
                              color: state is ErrorState
                                  ? AppColors.errorLight
                                  : state is SuccessState
                                  ? AppColors.successLight
                                  : AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  state is ErrorState
                                      ? Icons.error_outline
                                      : state is SuccessState
                                      ? Icons.check_circle_outline
                                      : Icons.verified_user_outlined,
                                  color: state is ErrorState
                                      ? AppColors.errorDefault
                                      : state is SuccessState
                                      ? AppColors.successDefault
                                      : AppColors.primaryDefault,
                                ),
                                SizedBox(width: context.w(12)),
                                Text(
                                  state is ErrorState
                                      ? state.message
                                      : state is SuccessState
                                      ? "Login Successful"
                                      : "One account for your learning or teaching journey.",
                                  style: AppStyle.small.copyWith(
                                    color: state is ErrorState
                                        ? AppColors.errorDefault
                                        : state is SuccessState
                                        ? AppColors.successDefault
                                        : AppColors.textGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.h(103)),
                          state is LoadingState
                              ? const CircularProgressIndicator()
                              : Button(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    final params = LoginParams(
                                      email: _controllerEmail.text,
                                      password: _controllerPassword.text,
                                    );
                                    if (state is! LoadingState) {
                                      context.read<LogInCubit>().login(params);
                                    }
                                  },
                                  title: "Login",
                                ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: context.h(12)),
                  Align(
                    alignment: .center,
                    child: CustomTextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(RouterName.selectRoleRegister);
                      },
                      title: "New to EduLearn? Create an account",
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
