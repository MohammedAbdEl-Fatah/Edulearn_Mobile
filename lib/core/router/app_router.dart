import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/feature/auth/presentation/view/confirm_email_screen.dart';
import 'package:edulearn_mobile/feature/auth/presentation/view/login_screen.dart';
import 'package:edulearn_mobile/feature/onbording/presentation/view/onbording_screen.dart';
import 'package:edulearn_mobile/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/view/forget_password_screen.dart';
import '../../feature/auth/presentation/view/reset_password_screen.dart';
import '../../feature/auth/presentation/view/select_role_register.dart';
import '../../feature/auth/presentation/view/student_register.dart';
import '../../feature/auth/presentation/view/teacher_register.dart';
import '../../feature/home/presentation/view/home_screen.dart';
import '../../feature/layout/presentation/view/layout_screen.dart';
part 'router_name.dart';

class AppRouter {
  AppRouter._();
  static Route<MaterialPageRoute> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouterName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouterName.onbording:
        return MaterialPageRoute(
          builder: (_) => const OnbordingScreen(),
          settings: setting,
        );
      case RouterName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: setting,
        );
      case RouterName.selectRoleRegister:
        return MaterialPageRoute(
          builder: (_) => const SelectRoleRegister(),
          settings: setting,
        );
      case RouterName.studentRegister:
        return MaterialPageRoute(
          builder: (_) => const StudentRegister(),
          settings: setting,
        );

      case RouterName.teacherRegister:
        return MaterialPageRoute(
          builder: (_) => const TeacherRegister(),
          settings: setting,
        );
      case RouterName.confirmEmail:
        return MaterialPageRoute(
          builder: (_) =>
              ConfirmEmailScreen(email: setting.arguments as String),
          settings: setting,
        );
      case RouterName.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
          settings: setting,
        );
      case RouterName.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
          settings: setting,
        );

      ///home screen
      case RouterName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: setting,
        );
      case RouterName.layout:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "it's problem with route",
                style: AppStyle.bodySemiBold,
              ),
            ),
          ),
        );
    }
  }
}
