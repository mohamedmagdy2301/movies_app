import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/tab_bar_build.dart';

class CustomTapbarHome extends StatelessWidget {
  const CustomTapbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: TabBarBuild(),
      ),
    );
  }
}
