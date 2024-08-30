import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_appbar_details.dart';
import 'package:shimmer/shimmer.dart';

class DetailsMovieScreen extends StatelessWidget {
  const DetailsMovieScreen({super.key, required this.movieEntity});
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarDetails(),
      body: CachedNetworkImage(
        height: 200,
        width: double.infinity,
        imageUrl: "https://image.tmdb.org/t/p/w500${movieEntity.backdropPath}",
        placeholder: (context, url) => Shimmer.fromColors(
          enabled: true,
          baseColor: const Color.fromARGB(136, 92, 92, 92),
          highlightColor: const Color.fromARGB(149, 116, 116, 116),
          child: Container(color: Colors.red),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
