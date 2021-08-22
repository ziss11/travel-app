import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class PhotosList extends StatelessWidget {
  final String img;

  PhotosList({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
        ),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    );
  }
}
