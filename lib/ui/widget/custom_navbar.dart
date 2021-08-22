import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    Widget iconNavbar(int index, String img) {
      return InkWell(
        onTap: () {
          context.read<PageCubit>().setPage(index);
        },
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              'images/$img.png',
              width: 24,
              color: context.read<PageCubit>().state == index
                  ? purpleColor
                  : greyColor,
            ),
            Spacer(),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? purpleColor
                    : transparentColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width - (2 * defaultMargin),
      height: 60,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconNavbar(0, "globe_icon"),
          iconNavbar(1, "book_icon"),
          iconNavbar(2, "card_icon"),
          iconNavbar(3, "setting_icon"),
        ],
      ),
    );
  }
}
