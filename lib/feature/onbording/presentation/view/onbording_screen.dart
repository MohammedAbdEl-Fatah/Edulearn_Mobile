import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/widgets/button.dart';
import 'package:edulearn_mobile/core/widgets/logo.dart';
import 'package:edulearn_mobile/feature/onbording/data/on_bording_data.dart';
import 'package:edulearn_mobile/feature/onbording/presentation/cubit/onbording_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/text_button.dart';
import '../widget/custom_text_widget.dart';
import '../widget/dot_widget.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnbordingCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: SizedBox.shrink(),
              leadingWidth: 0,
              title: Logo(),
              actions: [
                BlocBuilder<OnbordingCubit, OnbordingState>(
                  builder: (context, state) {
                    return switch (state) {
                      InitOnbordignState() => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextButton(
                          onPressed: () {
                            context.read<OnbordingCubit>().skip();
                            Navigator.of(context).pushNamed(RouterName.login);
                          },
                          title: "Skip",
                        ),
                      ),
                      FinalOnbordignState() => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(RouterName.login);
                          },
                          title: "Login",
                        ),
                      ),
                      EndOnbordignState() => const SizedBox.shrink(),
                    };
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: context.read<OnbordingCubit>().pageController,
                      onPageChanged: context
                          .read<OnbordingCubit>()
                          .onPageChanged,
                      itemCount: onBordingList.length,
                      itemBuilder: (context, index) {
                        return CustomTextWidget(
                          onBordingModel: onBordingList[index],
                        );
                      },
                    ),
                  ),
                  BlocBuilder<OnbordingCubit, OnbordingState>(
                    builder: (context, state) {
                      final cubit = context.read<OnbordingCubit>();
                      final isLast = state.i == cubit.lastIndex;
                      return Column(
                        children: [
                          DotWidget(
                            currentIndex: state.i,
                            count: onBordingList.length,
                          ),
                          Button(
                            onPressed: () {
                              if (isLast) {
                                cubit.skip();
                                Navigator.pushNamed(context, RouterName.login);
                              } else {
                                cubit.nextPage();
                              }
                            },
                            title: isLast ? "Get started" : "Continue",
                            icon: Icons.arrow_right_alt_outlined,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
