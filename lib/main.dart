import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indexapp/firebase_auth/google_sign_in.dart';
import 'package:indexapp/firebase_auth/auth_page.dart';
import 'package:indexapp/pages/create_account.dart';
import 'package:indexapp/firebase_auth/create_account_auth_page.dart';
import 'package:indexapp/pages/home_page.dart';
import 'package:indexapp/pages/main_login_signup_page.dart';
import 'package:indexapp/util/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        //debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: 'RobotoMono',
          primaryColor: Color.fromARGB(255, 80, 109, 255)
          ),
        initialRoute: MyRoute.LoginRoute,
        routes: {
          MyRoute.CreateAccountRoute:(context) => CreateUserAuthPage(),
          MyRoute.HomePageRoute:(context) => HomePage(),
          MyRoute.LoginRoute:(context) => AuthPage()
        },
      ),
    );
  }
}



