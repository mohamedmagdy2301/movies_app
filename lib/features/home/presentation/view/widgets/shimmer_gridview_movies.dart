import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridViewMovies extends StatelessWidget {
  const ShimmerGridViewMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: 21,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Shimmer.fromColors(
              enabled: true,
              baseColor: const Color.fromARGB(136, 92, 92, 92),
              highlightColor: const Color.fromARGB(149, 116, 116, 116),
              child: Container(color: const Color.fromARGB(103, 244, 67, 54)),
            ),
          );
        },
      ),
    );
  }
}
