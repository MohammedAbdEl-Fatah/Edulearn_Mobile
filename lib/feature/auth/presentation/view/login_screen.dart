import 'package:edulearn_mobile/core/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: MediaQuery.of(context).size.width * 0.6,
        title: Logo(),
      ),
    );
  }
}
