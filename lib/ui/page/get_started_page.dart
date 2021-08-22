import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/airplane_started_img.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fly Like a Bird",
                    style: whiteText.copyWith(
                      fontSize: 32,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Explore new world with us and let yourself get an amazing experiences",
                    textAlign: TextAlign.center,
                    style: whiteText.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    label: "Get Started",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign-up', (route) => false);
                    },
                    width: 220,
                    margin: EdgeInsets.only(bottom: 80),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
