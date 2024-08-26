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
  int _currentIndex = 1;

  final List<Widget> _tabs = [
    const SearchScreen(),
    const CustomBodyHome(),
    const SearchScreen(),
  ];
  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
