import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/routes.dart';


class OneTimePasswordPage extends StatefulWidget {
  const OneTimePasswordPage({super.key});

  @override
  State<OneTimePasswordPage> createState() => _OneTimePasswordPageState();
}

class _OneTimePasswordPageState extends State<OneTimePasswordPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String themeType =
        Theme.of(context).brightness.toString() == "Brightness.dark"
            ? "dark"
            : "light";
    String svgPath = "assets/images/verification_$themeType.svg";
    String otp = "";
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, height / 10, 0, 0),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                svgPath,
                semanticsLabel: 'Verification Logo',
                height: min(height, width) / 3,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                "Verification Code",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "We have texted you a code, please enter it",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              OtpTextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                numberOfFields: 6,

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  otp = code;
                },
                onSubmit: (String verificationCode) {
                  validateOtp();
                }, // end onSubmit
              ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }


  void validateOtp() {
    Navigator.pushNamed(context, MyRoutes.homeRoute);

  }
}
