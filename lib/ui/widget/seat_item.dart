import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  SeatItem({required this.id, this.isAvailable = true});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    seatColor() {
      if (isAvailable) {
        if (isSelected) {
          return purpleColor;
        } else {
          return lightPurpleColor;
        }
      } else {
        return unavailableColor;
      }
    }

    borderColor() {
      if (isAvailable) {
        return purpleColor;
      } else {
        return unavailableColor;
      }
    }
    text() {
      if (isSelected) {
        return Text(
          isSelected ? 'YOU' : '',
          textAlign: TextAlign.center,
          style: whiteText.copyWith(fontWeight: semibold),
        );
      }
      return SizedBox();
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectedSeat(id);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 48,
        height: 48,
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: seatColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: text(),
      ),
    );
  }
}
