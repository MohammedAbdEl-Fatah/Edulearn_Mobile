import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/feature/auth/presentation/view/login_screen.dart';
import 'package:edulearn_mobile/feature/onbording/presentation/view/onbording_screen.dart';
import 'package:edulearn_mobile/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
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
