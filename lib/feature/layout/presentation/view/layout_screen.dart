import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/feature/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutCubit>(
      create: (context) => LayoutCubit(0),
      child: Scaffold(
        body: BlocBuilder<LayoutCubit, int>(
          builder: (context, state) {
            return context.read<LayoutCubit>().screen[state];
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: AppColors.primaryDefault,
              unselectedItemColor: AppColors.textDark,
              backgroundColor: AppColors.backGroundWhite,
              currentIndex: context.watch<LayoutCubit>().state,
              onTap: (index) {
                context.read<LayoutCubit>().changePage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.chrome_reader_mode),
                  label: 'My Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
