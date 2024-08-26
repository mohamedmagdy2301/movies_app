import 'package:flutter/material.dart';
import 'package:movies_app/core/constant.dart';

class CustomItemFeaturedHome extends StatelessWidget {
  const CustomItemFeaturedHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Image.asset(
        imageText,
        fit: BoxFit.fill,
      ),
    );
  }
}
