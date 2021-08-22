import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/page/wallet_page.dart';
import 'package:airplane/ui/page/home_page.dart';
import 'package:airplane/ui/page/settings_page.dart';
import 'package:airplane/ui/page/transaction_page.dart';
import 'package:airplane/ui/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          floatingActionButton: CustomNavBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: buildContent(currentIndex),
        );
      },
    );
  }
}
