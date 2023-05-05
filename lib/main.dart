import 'package:admin_console/pages/doctor_page.dart';
import 'package:admin_console/pages/hospitalDisplayPage.dart';

import 'package:admin_console/pages/login_page.dart';
import 'package:admin_console/pages/otp_page.dart';
import 'package:admin_console/utils/routes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // light mode color #D55C26
  // dark mode color #F4B63F
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      themeMode: ThemeMode.system,

      // theme: ThemeData(useMaterial3: true),

      
      theme: FlexThemeData.light(
          scheme: FlexScheme.amber,
      ), 

      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
      ),
      initialRoute: MyRoutes.loginRoute,

      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.otpRoute: (context) => const OneTimePasswordPage(),

        MyRoutes.hospitalDisplayRoute: (context) => const HospitalDisplayPage(),
        MyRoutes.doctorDisplayRoute: (context) => const DoctorPaymentPage(),

      },
    );
  }
}

