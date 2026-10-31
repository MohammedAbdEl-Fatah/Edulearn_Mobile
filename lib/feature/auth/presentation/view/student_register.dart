import 'package:edulearn_mobile/core/di/injection_container.dart';
import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/feature/auth/domain/params/register_params.dart';
import 'package:edulearn_mobile/feature/auth/presentation/cubit/register_student/register_student_cubit.dart';
import 'package:edulearn_mobile/feature/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/text_button.dart';
import '../widget/custom_change_role.dart';
import '../widget/dob_field.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  DateTime? _dob;
  @override
  void dispose() {
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConfirmPassword.dispose();
    _controllerPhone.dispose();
    super.dispose();
  }

  void _registerStudent() {
    final reqTap = RegisterParams(
      firstName: _controllerFirstName.text,
      lastName: _controllerLastName.text,
      email: _controllerEmail.text,
      password: _controllerPassword.text,
      confirmPassword: _controllerConfirmPassword.text,
      phone: _controllerPhone.text,
      dob: _dob!,
    );

    context.read<RegisterStudentCubit>().signUp(reqTap);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterStudentCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          leadingWidth: MediaQuery.of(context).size.width * 0.6,
          title: const Logo(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(15)),
            child: Column(
              spacing: context.h(10),
              crossAxisAlignment: .start,
              children: [
                const Text("Start your next chapter", style: AppStyle.h1),
                Text(
                  "Create your account and make space for something new.",
                  style: AppStyle.caption.copyWith(color: AppColors.textGray),
                ),
                SizedBox(height: context.h(12)),
                Row(
                  children: [
                    const CustomChangeRole(role: "Student"),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouterName.teacherRegister,
                        );
                      },
                      title: "Change role",
                    ),
                  ],
                ),

                SizedBox(height: context.h(12)),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Frist Name",
                        header: "Frist Name",
                        controller: _controllerFirstName,
                        isObscure: false,
                      ),
                    ),
                    SizedBox(width: context.w(8)),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Last Name",
                        header: "Last Name",
                        controller: _controllerLastName,
                        isObscure: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(4)),
                CustomTextFormField(
                  hintText: "Email",
                  header: "Email",
                  controller: _controllerEmail,
                  isObscure: false,
                ),

                SizedBox(height: context.h(4)),
                CustomTextFormField(
                  hintText: "Password",
                  header: "Password",
                  controller: _controllerPassword,
                  isObscure: true,
                ),
                SizedBox(height: context.h(4)),

                CustomTextFormField(
                  hintText: "Confirm Password",
                  header: "Confirm Password",
                  controller: _controllerConfirmPassword,
                  isObscure: true,
                ),

                SizedBox(height: context.h(4)),
                CustomTextFormField(
                  hintText: "Phone",
                  header: "Phone",
                  controller: _controllerPhone,
                  isObscure: false,
                ),
                SizedBox(height: context.h(4)),
                DobField(
                  onDateSelected: (date) {
                    _dob = date;
                  },
                ),
                SizedBox(height: context.h(20)),
                BlocBuilder<RegisterStudentCubit, RegisterStudentState>(
                  builder: (context, state) {
                    return state is InitialRegisterStudentState
                        ? Button(
                            title: "Create Student account",
                            onPressed: _registerStudent,
                          )
                        : state is LoadingRegisterStudentState
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Button(
                                title: "Create Student account",
                                onPressed: _registerStudent,
                              ),
                              state is SuccessRegisterStudentState
                                  ? Text(
                                      "success",
                                      style: AppStyle.captionBold.copyWith(
                                        color: AppColors.successDefault,
                                      ),
                                    )
                                  : state is ErrorRegisterStudentState
                                  ? Text(
                                      state.message,
                                      style: AppStyle.captionBold.copyWith(
                                        color: AppColors.errorDefault,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          );
                  },
                ),

                //has account text button
                Align(
                  alignment: Alignment.center,
                  child: CustomTextButton(
                    title: "Already have an account? Login",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouterName.login,
                        (route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
