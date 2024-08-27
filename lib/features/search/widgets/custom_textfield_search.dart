import 'package:flutter/material.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({
    super.key,
    this.onSubmitted,
  });
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: "Search",
          filled: true,
          fillColor: const Color(0xFF3A3F47),
          border: customOutlineInputBorder(),
          enabledBorder: customOutlineInputBorder(),
          focusedBorder: customOutlineInputBorder(),
          hintStyle: const TextStyle(color: Color(0xFF67686D)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          suffixIcon: const Icon(Icons.search, color: Color(0xFF67686D)),
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
