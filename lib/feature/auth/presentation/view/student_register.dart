import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/feature/auth/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/text_button.dart';
import '../widget/custom_change_role.dart';
import '../widget/dob_field.dart';

class StudentRegister extends StatelessWidget {
  const StudentRegister({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // SizedBox(height: context.h(10)),
              Text(
                "Create your account and make space for something new.",
                style: AppStyle.caption.copyWith(color: AppColors.textGray),
              ),
              SizedBox(height: context.h(12)),
              Row(
                children: [
                  const CustomChangeRole(),
                  const Spacer(),
                  CustomTextButton(
                    onPressed: () {
                      // navigator to register teacher
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
                      controller: TextEditingController(),
                      isObscure: false,
                    ),
                  ),
                  SizedBox(width: context.w(8)),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: "Last Name",
                      header: "Last Name",
                      controller: TextEditingController(),
                      isObscure: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h(4)),
              CustomTextFormField(
                hintText: "Email",
                header: "Email",
                controller: TextEditingController(),
                isObscure: false,
              ),

              SizedBox(height: context.h(4)),
              CustomTextFormField(
                hintText: "Password",
                header: "Password",
                controller: TextEditingController(),
                isObscure: true,
              ),
              SizedBox(height: context.h(4)),

              CustomTextFormField(
                hintText: "Confirm Password",
                header: "Confirm Password",
                controller: TextEditingController(),
                isObscure: true,
              ),

              SizedBox(height: context.h(4)),
              CustomTextFormField(
                hintText: "Phone",
                header: "Phone",
                controller: TextEditingController(),
                isObscure: false,
              ),
              SizedBox(height: context.h(4)),
              const DobField(),
              SizedBox(height: context.h(20)),
              Button(
                title: "Create Student account",
                onPressed: () {
                  // logic to sign up for student
                },
              ),

              //has account text button
              Align(
                alignment: Alignment.center,
                child: CustomTextButton(
                  title: "Already have an account? Login",
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.login);
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
