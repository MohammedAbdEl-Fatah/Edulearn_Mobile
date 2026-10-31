import 'package:flutter/material.dart';

import '../../../../core/widgets/logo.dart';

class TeacherRegister extends StatelessWidget {
  const TeacherRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const SizedBox.shrink(),
          leadingWidth: MediaQuery.of(context).size.width * 0.6,
          title: const Logo(),
        ),
      body:Column(
        children: [
          
        ],
      ) ,
    );
  }
}