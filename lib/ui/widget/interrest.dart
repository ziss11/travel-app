import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class Interest extends StatelessWidget {
  final String text;

  Interest({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Image.asset('images/check_icon.png'),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: blackText.copyWith(
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }
}
