import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:flutter/material.dart';

class EdulearnApp extends StatelessWidget {
  const EdulearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edulearn',
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.splashScreen,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}
