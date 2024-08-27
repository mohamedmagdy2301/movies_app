import 'package:flutter/material.dart';
import 'package:movies_app/core/constant.dart';

class CustomBodySearch extends StatelessWidget {
  const CustomBodySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Opacity(
          opacity: .6,
          child: Image(image: AssetImage(searchIcon)),
        ),
      ),
    );
  }
}
