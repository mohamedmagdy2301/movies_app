import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 6,
      child: Scaffold(
        body: CustomBodyHome(),
      ),
    );
  }
}
