import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  CustomButton({
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 55,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(purpleColor),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: whiteText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
