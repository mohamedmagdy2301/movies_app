import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/view/widgets/custom_appbar_details.dart';

class DetailsMovieScreen extends StatelessWidget {
  const DetailsMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarDetails(),
      body: Center(
        child: Text(
          'Details Screen',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
