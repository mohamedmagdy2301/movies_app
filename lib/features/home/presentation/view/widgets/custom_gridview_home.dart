import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_item_category_home.dart';

class CustomGridviewCategoryHome extends StatelessWidget {
  const CustomGridviewCategoryHome({super.key, required this.movieList});
  final List<MovieEntity> movieList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: movieList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CustomItemCategoryHome(
            movieEntity: movieList[index],
          );
        },
      ),
    );
  }
}
