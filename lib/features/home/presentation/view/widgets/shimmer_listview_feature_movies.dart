import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListViewFeatureMovies extends StatelessWidget {
  const ShimmerListViewFeatureMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.34,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (itemContext, index) {
            return Shimmer.fromColors(
              enabled: true,
              baseColor: const Color.fromARGB(136, 92, 92, 92),
              highlightColor: const Color.fromARGB(149, 116, 116, 116),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AspectRatio(
                  aspectRatio: 2.65 / 4,
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
    );
  }
}
