import 'package:edulearn_mobile/core/di/injection_container.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/text_button.dart';
import '../../domain/params/register_params.dart';
import '../cubit/register_teacher/register_teacher_cubit.dart';
import '../widget/custom_change_role.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/dob_field.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({super.key});

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
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

  void _registeTeacher(BuildContext context) {
    final pragma = RegisterParams(
      firstName: _controllerFirstName.text,
      lastName: _controllerLastName.text,
      email: _controllerEmail.text,
      password: _controllerPassword.text,
      confirmPassword: _controllerConfirmPassword.text,
      phone: _controllerPhone.text,
      dob: _dob!,
    );
    context.read<RegisterTeacherCubit>().register(registerParams: pragma);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterTeacherCubit>(),
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
                const Text("Share your expertise", style: AppStyle.h1),
                SizedBox(height: context.h(10)),
                Text(
                  "Create courses. Help students grow.",
                  style: AppStyle.caption.copyWith(color: AppColors.textGray),
                ),

                SizedBox(height: context.h(12)),
                Row(
                  children: [
                    const CustomChangeRole(role: "Teacher"),
                    const Spacer(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouterName.studentRegister,
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

                //button
                BlocBuilder<RegisterTeacherCubit, RegisterTeacherState>(
                  builder: (context, state) {
                    return state is RegisterTeacherInitial
                        ? Button(
                            title: "Create Teacher account",
                            onPressed: () => _registeTeacher(context),
                          )
                        : state is RegisterTeacherLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Button(
                                title: "Create Student account",
                                onPressed: () => _registeTeacher(context),
                              ),
                              state is RegisterTeacherSuccess
                                  ? Text(
                                      "success",
                                      style: AppStyle.captionBold.copyWith(
                                        color: AppColors.successDefault,
                                      ),
                                    )
                                  : state is RegisterTeacherFailure
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
