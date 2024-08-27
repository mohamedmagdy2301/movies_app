import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_appbar_search.dart';

class CustomAppBarDetails extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titleAppBar: 'Details',
      leadingIcon: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(CupertinoIcons.back),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
