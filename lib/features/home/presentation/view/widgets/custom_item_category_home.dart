import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routers/routers_manager.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:shimmer/shimmer.dart';

class CustomItemCategoryHome extends StatelessWidget {
  const CustomItemCategoryHome({super.key, required this.movieEntity});
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(GoRouterManager.kDetailsScreen, extra: movieEntity);
        log(movieEntity.posterPath.toString());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: movieEntity.posterImageUrl,
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
