import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String type;
  final bool obsecureText;
  final TextEditingController controller;

  CustomTextField({
    required this.label,
    this.type = 'text',
    this.obsecureText = false,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool emailValid = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: blackText.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextField(
          controller: widget.controller,
          obscureText: widget.obsecureText,
          onChanged: (value) {
            bool isValid = EmailValidator.validate(value);
            if (widget.type == 'email') {
              if (isValid) {
                setState(() {
                  emailValid = true;
                });
              } else {
                emailValid = false;
              }
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: whiteColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            hintText: "Your ${widget.label}",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(
                width: 2,
                color: greyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(
                width: 2,
                color: emailValid ? purpleColor : redColor,
              ),
            ),
          ),
          style: blackText.copyWith(
            fontWeight: regular,
            fontSize: 16,
            color: emailValid ? blackColor : redColor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
