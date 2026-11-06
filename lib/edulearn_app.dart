import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'feature/user/presentation/cubit/user_cubit.dart';

class EdulearnApp extends StatelessWidget {
  const EdulearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<UserCubit>())],
      child: MaterialApp(
        title: 'Edulearn',
        debugShowCheckedModeBanner: false,
        initialRoute: RouterName.splashScreen,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backGroundWhite,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backGroundWhite,
          ),
        ),
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
    );
  }
}
