import 'package:flutter/material.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_appbar_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_gridview_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_listview_featured_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_tapbar_home.dart';

class CustomBodyHome extends StatelessWidget {
  const CustomBodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const CustomAppBarHome(),
        const CustomListViewFeaturedHome(),
        const CustomTapbarHome(),
      ],
      body: const TabBarView(
        children: [
          CustomGridviewCategoryHome(imageMovie: imageTest),
          CustomGridviewCategoryHome(imageMovie: imageTest1),
          CustomGridviewCategoryHome(imageMovie: imageTest2),
          CustomGridviewCategoryHome(imageMovie: imageTest),
          CustomGridviewCategoryHome(imageMovie: imageTest1),
          CustomGridviewCategoryHome(imageMovie: imageTest2),
        ],
      ),
    );
  }
}
