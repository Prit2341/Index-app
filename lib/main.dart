import 'package:flutter/material.dart';
import 'package:indexapp/pages/create_account.dart';
import 'package:indexapp/pages/home_page.dart';
import 'package:indexapp/pages/main_login_signup_page.dart';
import 'package:indexapp/util/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        primaryColor: Color.fromARGB(255, 80, 109, 255)
        ),
      initialRoute: MyRoute.LoginRoute,
      routes: {
        MyRoute.CreateAccountRoute:(context) => CreateAccount(),
        MyRoute.HomePageRoute:(context) => HomePage(),
        MyRoute.LoginRoute:(context) => LoginSignuppage()
      },
    );
  }
}



