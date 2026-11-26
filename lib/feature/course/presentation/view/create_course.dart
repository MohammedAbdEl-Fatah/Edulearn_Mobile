import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/extension.dart';
import '../../../../core/widgets/button.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final TextEditingController _nameCourseController = TextEditingController();
  final TextEditingController _descriptionCourseController =
      TextEditingController();
  final TextEditingController _levelCourseController = TextEditingController();
  final TextEditingController _priceCourseController = TextEditingController();
  final TextEditingController _discountCourseController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.075,
        title: const Text('Create Course', style: AppStyle.h3Bold),
      ),
      body: Padding(
        padding: const .symmetric(horizontal: 22, vertical: 20),
        child: Column(
          children: [
            Text(
              "Start with the essentials. You can add sessions after creating your course.",
              style: AppStyle.caption.copyWith(color: AppColors.textGray),
            ),
            SizedBox(height: context.h(20)),
            CustomTextFormField(
              hintText: "Enter course title",
              header: "Course Title",
              controller: _nameCourseController,
              isObscure: false,
            ),
            SizedBox(height: context.h(10)),
            CustomTextFormField(
              hintText: "Enter description",
              header: "Description",
              controller: _descriptionCourseController,
              isObscure: false,
            ),
            SizedBox(height: context.h(10)),

            //TODO ::implement contianer of thumbnail
            CustomTextFormField(
              hintText: "Enter level course",
              header: "Level Course",
              controller: _levelCourseController,
              isObscure: false,
            ),
            SizedBox(height: context.h(10)),
            CustomTextFormField(
              hintText: "Enter price",
              header: "Price",
              controller: _priceCourseController,
              isObscure: false,
            ),
            SizedBox(height: context.h(10)),
            CustomTextFormField(
              hintText: "Enter discount",
              header: "Discount",
              controller: _discountCourseController,
              isObscure: false,
            ),
            SizedBox(height: context.h(60)),
            Button(
              title: 'Create Course',
              onPressed: () {
                //TODO implement logic with cubit usecase create course
              },
            ),
          ],
        ),
      ),
    );
  }
}
