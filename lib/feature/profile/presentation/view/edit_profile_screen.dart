import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:edulearn_mobile/core/widgets/text_button.dart';
import 'package:edulearn_mobile/feature/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:edulearn_mobile/feature/user/data/model/user_model.dart';
import 'package:edulearn_mobile/feature/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/button.dart';
import '../../domain/params/edit_profile_params.dart';
import '../widget/item_card_text_field.dart';

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

  Future<void> _saveChanges(
    BuildContext cubitContext, {
    required EditProfileParams params,
  }) {
    return cubitContext.read<EditProfileCubit>().editProfile(params: params);
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

    return BlocProvider(
      create: (context) => sl<EditProfileCubit>(),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is SuccessEditProfileState) {
            context.read<UserCubit>().getUser();//change data in user cubit
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primaryLight,
                    child: Text(
                      userModel.firstName[0] +
                          userModel.lastName[0].toUpperCase(),
                      style: AppStyle.h2SemiBold.copyWith(
                        color: AppColors.primaryDefault,
                      ),
                    ),
                  ),
                  CustomTextButton(title: "change picture", onPressed: () {}),
                  ItemCardTextFeild(
                    text: "Full Name",
                    role: userModel.role,
                    controller: fullNameController,
                  ),
                  ItemCardTextFeild(text: "Email", controller: emailController),
                  ItemCardTextFeild(text: "About", controller: aboutController),
                  ItemCardTextFeild(text: "Phone", controller: phoneController),
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
                        child: BlocBuilder<EditProfileCubit, EditProfileState>(
                          builder: (context, state) {
                            if (state is LoadingEditProfileState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Button(
                              title: "Save",
                              onPressed: hasChanges
                                  ? () {
                                      final names = fullNameController.text
                                          .trim()
                                          .split(' ');
                                      _saveChanges(
                                        context,
                                        params: EditProfileParams(
                                          firstName: names.first,
                                          lastName: names.length > 1
                                              ? names.sublist(1).join(' ')
                                              : '',
                                          phone: phoneController.text,
                                          about: aboutController.text,
                                        ),
                                      );
                                    }
                                  : null,
                            );
                          },
                        ),
                      ),
                    ],
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
