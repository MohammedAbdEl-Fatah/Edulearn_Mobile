import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/app_style.dart';
import '../../../user/presentation/cubit/user_cubit.dart';
import '../widget/iteam_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserCubit>().state;
    final userModel = userState is SuccessUserState
        ? userState.userEntity
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 9,
          children: [
            Image.asset(AppImages.kLogo),
            const Text("Profile", style: AppStyle.h3Bold),
          ],
        ),
      ),
      body: userModel == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //avater
                CircleAvatar(
                  backgroundColor: AppColors.primaryLight,
                  radius: 32,
                  child: Text(
                    userModel.firstName.substring(0, 1) +
                        userModel.lastName.substring(0, 1).toUpperCase(),
                    style: AppStyle.h3Bold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                SizedBox(height: context.h(8)),
                //text name
                Text(userModel.fullName, style: AppStyle.h2SemiBold),
                //text email
                SizedBox(height: context.h(4)),
                Text(
                  userModel.email,
                  style: AppStyle.caption.copyWith(color: AppColors.textGray),
                ),
                //Role
                SizedBox(height: context.h(6)),
                Container(
                  padding: const .all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    userModel.role[0].toUpperCase() +
                        userModel.role.substring(1),
                    style: AppStyle.smallSemiBold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                SizedBox(height: context.h(16)),
                //row => count coures / student /rate
                Container(
                  padding: const .symmetric(vertical: 16),
                  margin: const .symmetric(horizontal: 22, vertical: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22.5)),
                    color: AppColors.primaryLight,
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            userModel.stats.courseCount,
                            style: AppStyle.h2.copyWith(
                              color: AppColors.primaryDefault,
                            ),
                          ),
                          Text(
                            "Course",
                            style: AppStyle.small.copyWith(
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                      //TODO in fatch data from new version
                      Column(
                        children: [
                          Text(
                            userModel.stats.courseCount.toString(),
                            style: AppStyle.h2.copyWith(
                              color: AppColors.primaryDefault,
                            ),
                          ),
                          Text(
                            "Student",
                            style: AppStyle.small.copyWith(
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          //TODO in fatch data from new version
                          Text(
                            (double.parse(userModel.stats.courseCount) /
                                    100 *
                                    14)
                                .toStringAsFixed(1),
                            style: AppStyle.h2.copyWith(
                              color: AppColors.primaryDefault,
                            ),
                          ),
                          Text(
                            "Rate",
                            style: AppStyle.small.copyWith(
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.h(16)),
                //card column => edit profile / notifacation / logout
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: AppColors.backGroundWhite,
                    child: Column(
                      children: [
                        IteamProfile(
                          title: "Edit Profile",
                          icon: Icons.person_3_outlined,
                        ),
                        IteamProfile(
                          title: "Notification",
                          icon: Icons.notifications_active,
                        ),
                        IteamProfile(title: "Logout", icon: Icons.logout),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.h(16)),
                //version app
                Text(
                  "Edulearn v1.0.0",
                  style: AppStyle.caption.copyWith(color: AppColors.textGray),
                ),
              ],
            ),
    );
  }
}
