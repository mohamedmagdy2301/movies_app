import 'package:flutter/material.dart';

class DetailsMovieScreen extends StatelessWidget {
  const DetailsMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Details Screen',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
