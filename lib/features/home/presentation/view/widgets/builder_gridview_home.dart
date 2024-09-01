import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_failure_message.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_gridview_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/shimmer_gridview_movies.dart';

class BuilderGridviewHome extends StatefulWidget {
  const BuilderGridviewHome({super.key, required this.catagory});
  final String catagory;

  @override
  State<BuilderGridviewHome> createState() => _BuilderGridviewHomeState();
}

class _BuilderGridviewHomeState extends State<BuilderGridviewHome> {
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context)
        .fetchMoviesInCubit(widget.catagory, 1);
    super.initState();
  }

  List<MovieEntity> moviesList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {
        if (state is MoviesSuccess) {
          moviesList.addAll(state.moviesList);
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
            state is MoviesPagenationFailure ||
            state is MoviesPagenationLoading) {
          return CustomGridviewCategoryHome(
              movieList: moviesList, catagory: widget.catagory);
        } else if (state is MoviesFailure) {
          return CustomFailureMessage(state.errMessage);
        } else {
          return const ShimmerGridViewMovies();
        }
      },
    );
  }
}
