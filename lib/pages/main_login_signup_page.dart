import 'package:flutter/material.dart';

class LoginSignuppage extends StatelessWidget {
  const LoginSignuppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //       Colors.red,
          //       Colors.white
          //     ]
          //   )
          // ),
          child: Column(
            children: [
              SizedBox(height: 70.0),
              Image.asset("assets/images/Welcome.png"),
              Text(
                "Welcome",
                style: TextStyle(
                  //color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}