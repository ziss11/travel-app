import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              state.error,
              style: whiteText.copyWith(fontWeight: medium),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          Center(child: CircularProgressIndicator());
        }
        return Center(
          child: CustomButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            label: "Sign Out",
            width: 220,
          ),
        );
      },
    );
  }
}
