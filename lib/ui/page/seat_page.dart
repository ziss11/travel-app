import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/page/checkout_page.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/ui/widget/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SeatPage extends StatelessWidget {
  final DestinationModel destination;

  SeatPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Your\nFavorite Seat",
            style: blackText.copyWith(
              fontSize: 24,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: lightPurpleColor,
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      border: Border.all(
                        color: purpleColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Available",
                    style: blackText.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Selected",
                    style: blackText.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: unavailableColor,
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Unavailable",
                    style: blackText.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    Widget seatForm() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
            child: Column(
              children: [
                //NOTE: SEAT TYPE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      child: Text(
                        "A",
                        textAlign: TextAlign.center,
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "B",
                        textAlign: TextAlign.center,
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "",
                        textAlign: TextAlign.center,
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "C",
                        textAlign: TextAlign.center,
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "D",
                        textAlign: TextAlign.center,
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ],
                ),
                //NOTE: SEAT 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: "A1",
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: "B1",
                      isAvailable: false,
                    ),
                    Text(
                      '1',
                      textAlign: TextAlign.center,
                    ),
                    SeatItem(
                      id: "C1",
                    ),
                    SeatItem(
                      id: "D1",
                      isAvailable: false,
                    ),
                  ],
                ),
                //NOTE: SEAT 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                    ),
                    SeatItem(
                      id: 'C2',
                    ),
                    SeatItem(
                      id: 'D2',
                    ),
                  ],
                ),
                //NOTE: SEAT 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A3',
                    ),
                    SeatItem(
                      id: 'B3',
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    SeatItem(
                      id: 'C3',
                    ),
                    SeatItem(
                      id: 'D3',
                    ),
                  ],
                ),
                //NOTE: SEAT 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A4',
                    ),
                    SeatItem(
                      id: 'B4',
                      isAvailable: false,
                    ),
                    Text(
                      '4',
                      textAlign: TextAlign.center,
                    ),
                    SeatItem(
                      id: 'C4',
                    ),
                    SeatItem(
                      id: 'D4',
                    ),
                  ],
                ),
                //NOTE: SEAT 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A5',
                    ),
                    SeatItem(
                      id: 'B5',
                    ),
                    Text(
                      '5',
                      textAlign: TextAlign.center,
                    ),
                    SeatItem(
                      id: 'C5',
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: 'D5',
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                //NOTE: SEAT SELECTED
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Seat',
                      style: greyText.copyWith(
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      state.join(', '),
                      style: blackText.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                //NNOTE: TOTAL
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: greyText.copyWith(
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(state.length * destination.price),
                      style: purpleText.copyWith(
                        fontWeight: semibold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    Widget button() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          int price = destination.price * state.length;
          double vat = destination.pajak;

          return CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destination,
                      traveleraCount: state.length,
                      seatSelected: state.join(', '),
                      insurance: true,
                      refund: false,
                      vat: vat,
                      price: price,
                      grandTotal: price + (price * vat).toInt(),
                    ),
                  ),
                ),
              );
            },
            label: "Continue to Checkout",
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 30,
          ),
          physics: BouncingScrollPhysics(),
          children: [
            header(),
            seatForm(),
            button(),
          ],
        ),
      ),
    );
  }
}
