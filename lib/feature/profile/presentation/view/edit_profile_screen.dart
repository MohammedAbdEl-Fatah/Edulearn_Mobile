import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/text_button.dart';
import 'package:edulearn_mobile/feature/user/data/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  late UserModel originalUserModel;
  bool hasChanges = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    originalUserModel = userModel;

    // Initialize controllers with original data only if they're empty
    if (fullNameController.text.isEmpty) {
      fullNameController.text = "${userModel.firstName} ${userModel.lastName}";
      phoneController.text = userModel.phone;
      emailController.text = userModel.email;
      aboutController.text = userModel.about;
    }
  }

  void _initializeControllers() {
    fullNameController.addListener(_checkForChanges);
    phoneController.addListener(_checkForChanges);
    emailController.addListener(_checkForChanges);
    aboutController.addListener(_checkForChanges);
  }

  void _checkForChanges() {
    final currentFullName = fullNameController.text;
    final currentPhone = phoneController.text;
    final currentEmail = emailController.text;
    final currentAbout = aboutController.text;

    final originalFullName =
        "${originalUserModel.firstName} ${originalUserModel.lastName}";
    final originalPhone = originalUserModel.phone;
    final originalEmail = originalUserModel.email;
    final originalAbout = originalUserModel.about;

    final changed =
        currentFullName != originalFullName ||
        currentPhone != originalPhone ||
        currentEmail != originalEmail ||
        currentAbout != originalAbout;

    if (changed != hasChanges) {
      setState(() {
        hasChanges = changed;
      });
    }
  }

  void _saveChanges() {
    // TODO: Implement save logic (e.g., API call to update user profile)
    // For now, just show a dialog or navigate back
    Navigator.pop(context);
  }

  void _cancelChanges() {
    fullNameController.text =
        "${originalUserModel.firstName} ${originalUserModel.lastName}";
    phoneController.text = originalUserModel.phone;
    emailController.text = originalUserModel.email;
    aboutController.text = originalUserModel.about;
    setState(() {
      hasChanges = false;
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .center,
            children: [
              //Avater image
              CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.primaryLight,
                child: Text(
                  userModel.firstName[0] + userModel.lastName[0].toUpperCase(),
                  style: AppStyle.h2SemiBold.copyWith(
                    color: AppColors.primaryDefault,
                  ),
                ),
              ),
              //Text button => change picture
              CustomTextButton(title: "change picture", onPressed: () {}),

              //field =>{full name , about ,age , phone, dob}
              ItemCardTextFeild(
                text: "Full Name",
                role: userModel.role,
                controller: fullNameController,
              ),
              ItemCardTextFeild(text: "Email", controller: emailController),
              ItemCardTextFeild(text: "About", controller: aboutController),
              ItemCardTextFeild(text: "Phone", controller: phoneController),
              //button change save
              SizedBox(height: context.h(32)),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      title: "Cancel",
                      onPressed: hasChanges ? _cancelChanges : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Button(
                      title: "Save",
                      onPressed: hasChanges ? _saveChanges : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCardTextFeild extends StatelessWidget {
  const ItemCardTextFeild({
    super.key,
    required this.controller,
    required this.text,
    this.role,
  });
  final String? role;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      color: AppColors.backGroundWhite,

      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(text, style: AppStyle.bodyBold),
              if (role != null)
                Text(
                  "\t - \t${role?[0].toUpperCase()}${role?.substring(1)}",
                  style: AppStyle.bodyBold,
                ),
            ],
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.backGround),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.backGround),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
