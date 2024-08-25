import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.suffixIcon,
    required this.labelText,
    this.onSubmitted,
  });
  final Icon suffixIcon;
  final String labelText;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: customOutlineInputBorder(),
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
        suffixIcon: suffixIcon,
        labelText: 'Search Book',
        labelStyle: TextStyle(
          color: ColorsManager.kGrey,
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: ColorsManager.kGrey),
    );
  }
}
