import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/text_button.dart';
import '../widget/select_role_container.dart';

class SelectRoleRegister extends StatefulWidget {
  const SelectRoleRegister({super.key});

  @override
  State<SelectRoleRegister> createState() => _SelectRoleRegisterState();
}

class _SelectRoleRegisterState extends State<SelectRoleRegister> {
  String selectedRole = 'student';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: MediaQuery.of(context).size.width * 0.6,
        title: const Logo(),
      ),
      body: Padding(
        padding: const .symmetric(horizontal: 24, vertical: 22),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "MAKE IT YOUR OWN",
              style: AppStyle.smallBold.copyWith(
                color: AppColors.primaryDefault,
              ),
            ),
            SizedBox(height: context.h(10)),
            const Text("How will you join us?", style: AppStyle.h1),
            SizedBox(height: context.h(10)),
            Text(
              "Choose your role so we can tailor your EduLearn experience.",
              style: AppStyle.caption.copyWith(color: AppColors.textGray),
            ),
            SizedBox(height: context.h(24)),
            // select role
            SelectRoleContainer(
              title: 'Student',
              subtitle: 'Turn curiosity into confidence',
              description:
                  'Explore courses, learn new skills and track your progress.',
              icon: Icons.school_rounded,
              value: 'student',
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
            SizedBox(height: context.h(16)),
            SelectRoleContainer(
              title: 'Teacher',
              subtitle: 'Share what you know',
              description:
                  'Create courses, support your students and inspire their next step.',
              icon: Icons.co_present_rounded,
              value: 'teacher',
              groupValue: selectedRole,
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
            // button
            const Spacer(),
            Button(
              title:
                  "Continue as ${selectedRole.replaceFirst(selectedRole[0], selectedRole[0].toUpperCase())}",
              onPressed: () {
                if (selectedRole == "student") {
                  Navigator.pushNamed(context, RouterName.studentRegister);
                } else {
                  // Navigator.pushNamed(context, RouterName.teacherRegister);
                }
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
    );
  }
}
