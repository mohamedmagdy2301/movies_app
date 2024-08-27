import 'package:flutter/material.dart';
import 'package:movies_app/features/search/widgets/custom_appbar_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarSearch(),
    );
  }
}
