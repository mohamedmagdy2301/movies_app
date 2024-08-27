import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_appbar_search.dart';
import 'package:movies_app/features/search/widgets/custom_body_search.dart';
import 'package:movies_app/features/search/widgets/custom_textfield_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        titleAppBar: 'Search',
        iconAppBar: CupertinoIcons.search,
      ),
      body: Column(
        children: [
          CustomTextFieldSearch(),
          CustomBodySearch(),
        ],
      ),
    );
  }
}
