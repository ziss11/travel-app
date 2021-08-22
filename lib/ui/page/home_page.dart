import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/destination_card.dart';
import 'package:airplane/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DestinationCubit>().fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,\n${state.user.name}",
                          style: blackText.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Where to fly today?",
                          style: greyText.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'images/me_pic.png',
                    width: 60,
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget destinationCard(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: 200,
        height: 323,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: destination.map((destination) {
            return DestinationCard(destination: destination);
          }).toList(),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(bottom: 90, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Text(
                "New This Year",
                style: blackText.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
            ),
            Column(
              children: destination.map((destination) {
                return DestinationTile(destination: destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
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
        if (state is DestinationSucces) {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              header(),
              destinationCard(state.destination),
              newDestinations(state.destination),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
