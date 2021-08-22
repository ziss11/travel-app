import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transaction.length == 0) {
            return Center(
              child: Text("Kamu belum memiliki transaksi!!!"),
            );
          } else {
            return SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 60),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.transaction.length,
                      itemBuilder: (context, index) {
                        return TransactionCard(
                            transaction: state.transaction[index]);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: whiteColor,
                    ),
                    child: Text(
                      "Transaction",
                      style: blackText.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return SizedBox();
      },
    );
  }
}
