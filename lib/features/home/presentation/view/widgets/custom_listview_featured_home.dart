import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_item_featured_home.dart';

class CustomListViewFeaturedHome extends StatefulWidget {
  const CustomListViewFeaturedHome({super.key});

  @override
  State<CustomListViewFeaturedHome> createState() =>
      _CustomListViewFeaturedHomeState();
}

class _CustomListViewFeaturedHomeState
    extends State<CustomListViewFeaturedHome> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: PageView.builder(
            padEnds: false,
            itemCount: 10,
            controller: PageController(viewportFraction: 0.5),
            onPageChanged: (index) => setState(() => _index = index),
            scrollDirection: Axis.horizontal,
            itemBuilder: (itemContext, index) {
              return Container(
                color: Colors.transparent,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  padding: EdgeInsets.all(_index == index ? 5 : 15),
                  child: const CustomItemFeaturedHome(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
