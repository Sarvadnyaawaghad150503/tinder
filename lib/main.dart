import 'package:flutter/material.dart';
// import 'package:tinder/Screens/LoginScreen.dart';
import 'package:tinder/authenticationScreen/login_screen2.dart';
import 'package:tinder/authenticationScreen/login_screen.dart';
import 'package:tinder/authenticationScreen/formscreen.dart';
import 'package:tinder/authenticationScreen/main_page.dart';
import 'package:tinder/authenticationScreen/registration_screen.dart';
import 'package:tinder/authenticationScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinder Clone',
      theme: ThemeData(
        primaryColor: Colors.white,
        // secondaryHeaderColor: Color.fromRGBO(255, 88, 100, 1.0),
      ),
      home: LoginScreen(),
    );
  }
}
