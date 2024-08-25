import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    this.backgroundColorButton,
    required this.tilteButton,
    required this.textStyleButton,
    this.iconColor,
    this.onTap,
    required this.icon,
  });
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColorButton, iconColor;
  final String tilteButton;
  final TextStyle textStyleButton;

  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            color: backgroundColorButton ?? Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tilteButton, style: textStyleButton),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(
                icon,
                color: iconColor,
                size: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
