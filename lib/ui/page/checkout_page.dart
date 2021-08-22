import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/ui/widget/details_item_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  CheckoutPage(this.transaction);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 43 - defaultMargin,
            ),
            child: Image.asset(
              'images/route.png',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CGK",
                    style: blackText.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    "Tangerang",
                    style: greyText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "TLC",
                    style: blackText.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    "Ciliwung",
                    style: greyText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    Widget bookingDetailsForm() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOTE: DESTINATION DETAILS
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      child: Image.network(
                        transaction.destination.imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            transaction.destination.name,
                            overflow: TextOverflow.ellipsis,
                            style: blackText.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            transaction.destination.location,
                            overflow: TextOverflow.ellipsis,
                            style: greyText.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: orangeColor,
                    ),
                    Text(
                      transaction.destination.rate.toString(),
                      style: blackText.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //NOTE: DETAIL BOOKING
                Text(
                  "Booking Details",
                  style: blackText.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DetailItemPoint(
                  pointName: "Traveler",
                  text: transaction.traveleraCount.toString() + " person",
                ),
                DetailItemPoint(
                  pointName: "Seat",
                  text: transaction.seatSelected,
                ),
                DetailItemPoint(
                  type: 1,
                  pointName: "Insurance",
                  text: transaction.insurance ? 'YES' : 'NO',
                ),
                DetailItemPoint(
                  type: 2,
                  pointName: "Refundable",
                  text: transaction.refund ? 'YES' : 'NO',
                ),
                DetailItemPoint(
                  pointName: "VAT",
                  text: (transaction.vat * 100).toStringAsFixed(0) + '%',
                ),
                DetailItemPoint(
                  pointName: "Price",
                  text: NumberFormat.currency(
                    locale: 'id',
                    symbol: "IDR ",
                    decimalDigits: 0,
                  ).format(transaction.price),
                ),
                DetailItemPoint(
                  pointName: "Grand Total",
                  text: NumberFormat.currency(
                    locale: 'id',
                    symbol: "IDR ",
                    decimalDigits: 0,
                  ).format(transaction.grandTotal),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Details",
                  style: blackText.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/wallet_card.png',
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/logo_airplane.png',
                            width: 24,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Pay",
                            style: whiteText.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: "IDR ",
                            decimalDigits: 0,
                          ).format(
                              state is AuthSucces ? state.user.balance : 0),
                          style: blackText.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Current Balance",
                          style: greyText.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
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
      return Column(
        children: [
          BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              if (state is TransactionSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/success-checkout', (route) => false);
              } else if (state is TransactionFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      state.error,
                      style: whiteText.copyWith(fontWeight: medium),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is TransactionLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomButton(
                onPressed: () {
                  context
                      .read<TransactionCubit>()
                      .createTransactions(transaction);
                },
                label: "Pay Now",
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Terms and Conditions",
              textAlign: TextAlign.center,
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 50,
          ),
          children: [
            header(),
            bookingDetailsForm(),
            paymentDetails(),
            button(),
          ],
        ),
      ),
    );
  }
}
