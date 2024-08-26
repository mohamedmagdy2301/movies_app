import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: ColorsManager.kPrimaryColorBlack,
      elevation: 0,
      floating: true,
      snap: true,
      centerTitle: true,
      title: Text(
        'Movies',
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Matemasie",
          fontSize: 25,
        ),
      ),
    );
  }
}
