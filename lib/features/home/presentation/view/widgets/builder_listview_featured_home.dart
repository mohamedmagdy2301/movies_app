import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_failure_message.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_listview_featured_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/shimmer_listview_feature_movies.dart';

class BuilderListviewFeaturedHome extends StatefulWidget {
  const BuilderListviewFeaturedHome({super.key});

  @override
  State<BuilderListviewFeaturedHome> createState() =>
      _BuilderListviewFeaturedHomeState();
}

class _BuilderListviewFeaturedHomeState
    extends State<BuilderListviewFeaturedHome> {
  List<MovieEntity> movieList = [];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (BuildContext context, MoviesState state) {
          if (state is MoviesSuccess) {
            movieList.addAll(state.moviesList);
            log(movieList.length.toString());
            log("Movies Loaded");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Movies Loaded"),
                duration: Durations.short1,
              ),
            );
          }
          if (state is MoviesPagenationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MoviesSuccess ||
              state is MoviesPagenationLoading ||
              state is MoviesPagenationFailure) {
            return CustomListViewFeaturedHome(movieList: movieList);
          } else if (state is MoviesFailure) {
            return CustomFailureMessage(state.errMessage);
          } else {
            return const ShimmerListViewFeatureMovies();
          }
        },
      ),
    );
  }
}
