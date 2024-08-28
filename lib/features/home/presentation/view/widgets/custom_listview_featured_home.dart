import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
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
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: PageView.builder(
          padEnds: false,
          itemCount: widget.movieList.length,
          controller: PageController(viewportFraction: 0.5),
          onPageChanged: (index) => setState(() => _index = index),
          scrollDirection: Axis.horizontal,
          itemBuilder: (itemContext, index) {
            return Container(
              color: Colors.transparent,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                padding: _index == index
                    ? const EdgeInsets.symmetric(horizontal: 8)
                    : const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child:
                    CustomItemFeaturedHome(movieImage: widget.movieList[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
