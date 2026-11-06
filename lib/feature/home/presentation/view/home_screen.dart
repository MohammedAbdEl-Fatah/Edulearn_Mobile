import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:edulearn_mobile/core/widgets/logo.dart';
import 'package:edulearn_mobile/core/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widget/custom_datails_course_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: const Logo(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: const Text("Good morning, Mohammed", style: AppStyle.h1)
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(
                    begin: 0.2,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOut,
                  ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CustomDetailsCourseItem()
                        .animate(delay: (index * 150).ms)
                        .fadeIn(duration: 500.ms)
                        .slideX(begin: 0.2, end: 0, duration: 500.ms);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const Text("All Courses", style: AppStyle.h3Bold),
                  const Spacer(),
                  CustomTextButton(onPressed: () {}, title: "see all"),
                ],
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const CustomDetailsCourseItem()
                    .animate(delay: (index * 100).ms)
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.15, end: 0, duration: 400.ms);
              }, childCount: 5),
            ),
          ],
        ),
      ),
    );
  }
}
