import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListViewFeatureMovies extends StatefulWidget {
  const ShimmerListViewFeatureMovies({
    super.key,
  });

  @override
  State<ShimmerListViewFeatureMovies> createState() =>
      _ShimmerListViewFeatureMoviesState();
}

class _ShimmerListViewFeatureMoviesState
    extends State<ShimmerListViewFeatureMovies> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: const Color.fromARGB(136, 92, 92, 92),
      highlightColor: const Color.fromARGB(149, 116, 116, 116),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
            padEnds: false,
            itemCount: 20,
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
                      : const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                  child: AspectRatio(
                    aspectRatio: 2.7 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(color: Colors.red),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
