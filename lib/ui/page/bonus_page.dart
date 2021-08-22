import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget walletCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              padding: EdgeInsets.all(defaultMargin),
              margin: EdgeInsets.only(bottom: 80),
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/wallet_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: purpleColor.withOpacity(.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: whiteText.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            state.user.name,
                            style: whiteText.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
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
                  SizedBox(
                    height: 41,
                  ),
                  Text(
                    "Balance",
                    style: whiteText.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: "IDR ",
                      decimalDigits: 0,
                    ).format(state.user.balance),
                    style: whiteText.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget content() {
      return Column(
        children: [
          Text(
            "Big Bonus 🎉",
            style: blackText.copyWith(
              fontSize: 32,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "We give you early credit so that\nyou can buy a flight ticket",
            textAlign: TextAlign.center,
            style: greyText.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
          ),
        ],
      );
    }

    Widget button() {
      return CustomButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        },
        label: "Start Fly Now",
        width: 220,
        margin: EdgeInsets.only(top: 50),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              walletCard(),
              content(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
