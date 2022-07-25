import 'package:flutter/material.dart';
import 'package:indexapp/pages/main_login_signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: LoginSignuppage(),
    );
  }
}


