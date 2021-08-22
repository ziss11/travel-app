import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailItemPoint extends StatelessWidget {
  final int type;
  final String pointName;
  final String text;
  // type:
  // 0 : black
  // 1 : green
  // 2 : red
  // 3 : purple

  DetailItemPoint({
    this.type = 0,
    required this.pointName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    textColor() {
      switch (type) {
        case 1:
          return greenText.copyWith(
            fontWeight: semibold,
          );
        case 2:
          return redText.copyWith(
            fontWeight: semibold,
          );
        case 3:
          return purpleText.copyWith(
            fontWeight: semibold,
          );
        default:
          return blackText.copyWith(
            fontWeight: semibold,
          );
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('images/check_icon.png'),
              SizedBox(
                width: 6,
              ),
              Text(
                pointName,
                style: blackText.copyWith(
                  fontWeight: regular,
                ),
              ),
              Spacer(),
              Text(
                text,
                style: textColor(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
