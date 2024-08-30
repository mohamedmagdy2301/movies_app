import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_failure_message.dart';
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
    BlocProvider.of<MoviesCubit>(context).fetchMoviesInCubit(widget.catagory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesSuccess) {
          return CustomGridviewCategoryHome(movieList: state.moviesList);
        } else if (state is MoviesFailure) {
          return CustomFailureMessage(state.errMessage);
        } else {
          return const ShimmerGridViewMovies();
        }
      },
    );
  }
}
