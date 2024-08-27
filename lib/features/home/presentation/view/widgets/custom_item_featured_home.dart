import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

class CustomItemFeaturedHome extends StatelessWidget {
  const CustomItemFeaturedHome({super.key, required this.movieImage});
  final MovieEntity movieImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl:
                "https://image.tmdb.org/t/p/w500${movieImage.posterPath ?? "/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg"}",
            fit: BoxFit.fill,
          ),
        ));
  }
}
