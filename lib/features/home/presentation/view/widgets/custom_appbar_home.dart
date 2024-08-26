import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
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
