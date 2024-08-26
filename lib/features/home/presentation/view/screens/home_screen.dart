import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_appbar_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_listview_featured_home.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_tapbar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const CustomAppBarHome(),
            const CustomListViewFeaturedHome(),
            const CustomTapbarHome(),
          ],
          body: const TabBarView(
            children: [
              Center(child: Text('1', style: TextStyle(fontSize: 70))),
              Center(child: Text('2', style: TextStyle(fontSize: 70))),
              Center(child: Text('3', style: TextStyle(fontSize: 70))),
              Center(child: Text('4', style: TextStyle(fontSize: 70))),
              Center(child: Text('5', style: TextStyle(fontSize: 70))),
              Center(child: Text('6', style: TextStyle(fontSize: 70))),
            ],
          ),
        ),
      ),
    );
  }
}
