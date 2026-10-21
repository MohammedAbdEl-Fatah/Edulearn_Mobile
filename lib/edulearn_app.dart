import 'package:flutter/material.dart';

import 'feature/splash/presentation/splash_screen.dart';

class EdulearnApp extends StatelessWidget {
  const EdulearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edulearn',
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
    );
  }
}
