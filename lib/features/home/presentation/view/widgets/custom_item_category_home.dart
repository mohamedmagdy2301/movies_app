import 'package:flutter/material.dart';
import 'package:movies_app/core/constant.dart';

class CustomItemCategoryHome extends StatelessWidget {
  const CustomItemCategoryHome({super.key, required this.imageMovie});
  final String imageMovie;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageMovie,
      fit: BoxFit.fill,
    );
  }
}
