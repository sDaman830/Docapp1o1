import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String themeType = Theme.of(context).brightness.toString()=="Brightness.dark"?"dark":"light";
    String svgPath = "assets/images/login_$themeType.svg";
    
    

    return Scaffold(
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            SvgPicture.asset(
              svgPath,
              semanticsLabel: 'Login logo',
              
              height: min(height, width)/3,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              "Sign In",
              textScaleFactor: 1.5,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/10, vertical: height/15),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Mobile Number",
                    labelText: "Mobile Number"),
                  validator: (value) {
                    if (value?.length != 10) {
                      return "please enter a valid number";
                    }
                    if (value == null || value.isEmpty) {
                      return "please enter mobile number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    changeButton = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  if(!mounted) return;
                  Navigator.pushNamed(context, MyRoutes.otpRoute);
                  setState(() {
                    changeButton = false;
                  });
                }
              },
              child: Container(
                width: width * 0.6,
                height: height * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonTheme.colorScheme?.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: (changeButton)
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "GET OTP",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
