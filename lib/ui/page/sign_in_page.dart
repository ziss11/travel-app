import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widget/custom_button.dart';
import 'package:airplane/ui/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController hobby = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          "Sign In with your\nexisting account",
          style: blackText.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget inputForm() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              CustomTextField(
                label: "Email Address",
                type: 'email',
                controller: email,
              ),
              CustomTextField(
                label: "Password",
                type: "password",
                obsecureText: true,
                controller: password,
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSucces) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main-page', (route) => false);
                  } else if (state is AuthFailed) {
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
                  if (state is AuthLoading) {
                    Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    label: "Sign In",
                    onPressed: () {
                      context.read<AuthCubit>().signIn(
                            email: email.text,
                            password: password.text,
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget textButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(
            "Don\'t have account? Sign Up",
            textAlign: TextAlign.center,
            style: greyText.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              title(),
              inputForm(),
              textButton(),
              SizedBox(
                height: 73,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
