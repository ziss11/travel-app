import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/details_item_point.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: defaultMargin,
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
  }
}
