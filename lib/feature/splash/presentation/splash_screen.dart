import 'dart:developer';

import 'package:edulearn_mobile/core/router/app_router.dart';
import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_images.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:flutter/material.dart';

import '../../../core/storage/key_shared_preferences.dart';
import '../../../core/storage/storage_shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationLogo;
  late Animation<double> _animationText;
  late Animation<Offset> _textAnimation;
  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) {
        checkAppStart(context);
      }
    });
  }

  Future<void> checkAppStart(BuildContext context) async {
    final isWatch =
        StorageSharedPreferences.storage.get<bool>(
          KeySharedPreferences.isWatch.name,
        ) ??
        false;
    log(isWatch.toString());
    if (!context.mounted) return;

    if (!isWatch) {
      await Navigator.pushReplacementNamed(context, RouterName.onbording);
      return;
    }

    await Navigator.pushReplacementNamed(context, RouterName.authGate);
  }

  void init() async {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      // value: 1,
    );

    _animationLogo = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animationText = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _textAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(_animationText);
    await _controller.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -size.width * 0.35,
            top: size.height * 0.28,
            child: _circle(size.width * 1),
          ),
          Positioned(
            right: -size.width * 0.26,
            bottom: size.height * 0.084,
            child: _circle(size.width * 0.65),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: _animationLogo,
                  child: Image.asset(
                    AppImages.kLogoSplash,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 22),
                SlideTransition(
                  position: _textAnimation,
                  child: const Text('EduLearn', style: AppStyle.display),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double diameter) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryLight,
      ),
    );
  }
}
