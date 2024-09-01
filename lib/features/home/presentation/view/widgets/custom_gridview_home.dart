import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/manage/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_item_category_home.dart';

class CustomGridviewCategoryHome extends StatefulWidget {
  const CustomGridviewCategoryHome(
      {super.key, required this.movieList, required this.catagory});
  final List<MovieEntity> movieList;
  final String catagory;

  @override
  State<CustomGridviewCategoryHome> createState() =>
      _CustomGridviewCategoryHomeState();
}

class _CustomGridviewCategoryHomeState
    extends State<CustomGridviewCategoryHome> {
  int nextPage = 2;
  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollExtent && !isLoading) {
      setState(() {
        isLoading = true;
      });

      BlocProvider.of<MoviesCubit>(context)
          .fetchMoviesInCubit(widget.catagory, nextPage++)
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: widget.movieList.length,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CustomItemCategoryHome(
            movieEntity: widget.movieList[index],
          );
        },
      ),
    );
  }
}
