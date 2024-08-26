import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;

  final void Function(int)? onTap;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.white,
      unselectedItemColor: ColorsManager.kGrey,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconSize: 25,
      selectedFontSize: 11,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
