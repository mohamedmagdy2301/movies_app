import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemFeaturedHome extends StatelessWidget {
  const CustomItemFeaturedHome({super.key, required this.movieImage});
  final MovieEntity movieImage;

  @override
  Widget build(BuildContext context) {
    return movieImage.posterPath == null
        ? const SizedBox()
        : AspectRatio(
            aspectRatio: 2.7 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500${movieImage.posterPath}",
                placeholder: (context, url) => Shimmer.fromColors(
                  enabled: true,
                  baseColor: const Color.fromARGB(136, 92, 92, 92),
                  highlightColor: const Color.fromARGB(149, 116, 116, 116),
                  child: Container(color: Colors.red),
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
  }
}
