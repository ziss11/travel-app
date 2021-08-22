import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccesCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/scheduling_img.png',
                width: 300,
                height: 150,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Well Booked 😍",
                style: blackText.copyWith(
                  fontSize: 32,
                  fontWeight: semibold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Are you ready to explore the new world of experiences?",
                textAlign: TextAlign.center,
                style: greyText.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main-page', (route) => false);
                },
                label: "My Booking",
                width: 220,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
