// splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tinder/authenticationScreen/explore_screen.dart';
import 'package:tinder/authenticationScreen/login_screen2.dart';
import 'package:tinder/authenticationScreen/main_page.dart';
import 'package:tinder/authenticationScreen/registration_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  Future<void> navigateToLogin() async {
    // Add a delay before navigating to the login screen
    await Future.delayed(Duration(seconds: 4));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Image.asset(
              'images/tinder_logo2.png',
              height: 50,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
