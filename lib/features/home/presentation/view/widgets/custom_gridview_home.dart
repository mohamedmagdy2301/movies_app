import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_item_category_home.dart';

class CustomGridviewCategoryHome extends StatelessWidget {
  const CustomGridviewCategoryHome({super.key, required this.imageMovie});
  final String imageMovie;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CustomItemCategoryHome(
          imageMovie: imageMovie,
        );
      },
    );
  }
}
