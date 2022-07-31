import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Text(
                    "Create Your Account",
                    style: TextStyle(
                      color: Color.fromARGB(255, 80, 109, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                    ),
                    Text(
                    "Create Your Account so you can Sell and\n Buy Land",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 78, 78),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                    ),
          ],
        ),
      )
    );
    
  }
}