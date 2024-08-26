import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routers/routers_manager.dart';

class CustomItemCategoryHome extends StatelessWidget {
  const CustomItemCategoryHome({super.key, required this.imageMovie});
  final String imageMovie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(GoRouterManager.kDetailsScreen);
      },
      child: Image.asset(
        imageMovie,
        fit: BoxFit.fill,
      ),
    );
  }
}
