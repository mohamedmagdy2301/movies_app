import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    this.leadingIcon,
  });
  final String titleAppBar;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(titleAppBar),
      elevation: 0,
      leading: leadingIcon,
      backgroundColor: Colors.transparent,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(CupertinoIcons.info, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
