import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/page/seat_page.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/ui/widget/interrest.dart';
import 'package:airplane/ui/widget/photos_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final DestinationModel destination;

  DetailPage(this.destination);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.destination.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 236),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                width: double.infinity,
                height: 214,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.95),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.destination.name,
                            overflow: TextOverflow.ellipsis,
                            style: whiteText.copyWith(
                              fontSize: 24,
                              fontWeight: semibold,
                            ),
                          ),
                          Text(
                            widget.destination.location,
                            style: whiteText.copyWith(
                              fontSize: 16,
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
                      widget.destination.rate.toString(),
                      style: whiteText.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: blackColor.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: whiteColor,
                    ),
                  ),
                ),
                Container(
                  width: 108,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/emblem.png'),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: blackColor.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: isFav ? orangeColor : whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget contentCard() {
      return Container(
        margin: EdgeInsets.only(
          top: 400,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 30,
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
            Text(
              "About",
              style: blackText.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
              overflow: TextOverflow.clip,
              style: blackText.copyWith(
                fontWeight: regular,
                height: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Photos",
              style: blackText.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                PhotosList(img: 'images/photos1.png'),
                PhotosList(img: 'images/photos2.png'),
                PhotosList(img: 'images/photos3.png'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Interest",
              style: blackText.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Interest(text: "Kids Park"),
                Interest(text: "City Museum"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Interest(text: "Honor Bridge"),
                Interest(text: "Central Mall"),
              ],
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(widget.destination.price),
                    style: blackText.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "per orang",
                    style: greyText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeatPage(destination: widget.destination),
                  ),
                );
              },
              label: "Book Now",
              width: 170,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                header(),
                contentCard(),
              ],
            ),
            footer(),
          ],
        ),
      ),
    );
  }
}
