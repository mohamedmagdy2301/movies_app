import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_body_home.dart';
import 'package:movies_app/features/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;

  final List<Widget> _tabs = [
    const CustomBodyHome(),
    const SearchScreen(),
    const SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          body: _tabs[_currentIndex],
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ));
  }
}
