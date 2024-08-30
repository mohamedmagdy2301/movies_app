import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class TabBarBuild extends StatelessWidget {
  const TabBarBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorsManager.kLightGrey,
      ),
      splashBorderRadius: BorderRadius.circular(50),
      indicatorColor: const Color.fromARGB(135, 255, 255, 255),
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.tab,
      // indicator: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: ColorsManager.kGrey,
      //   border: Border.all(color: ColorsManager.kGrey),
      // ),
      isScrollable: true,
      dividerHeight: 0,
      physics: const BouncingScrollPhysics(),
      tabAlignment: TabAlignment.center,
      tabs: const [
        Tab(text: 'Now Playing'),
        Tab(text: 'Upcoming'),
        Tab(text: 'Popular'),
      ],
    );
  }
}
