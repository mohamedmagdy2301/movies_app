import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_item_featured_home.dart';

class CustomListViewFeaturedHome extends StatefulWidget {
  const CustomListViewFeaturedHome({super.key, required this.movieList});
  final List<MovieEntity> movieList;

  @override
  State<CustomListViewFeaturedHome> createState() =>
      _CustomListViewFeaturedHomeState();
}

class _CustomListViewFeaturedHomeState
    extends State<CustomListViewFeaturedHome> {
  int nextPage = 2;
  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(addListener);
  }

  void addListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<MoviesCubit>(context)
            .fetchMoviesInCubit("top_rated", nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
          itemCount: widget.movieList.length,
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (itemContext, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: CustomItemFeaturedHome(
                movieImage: widget.movieList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
