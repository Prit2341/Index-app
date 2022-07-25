import 'package:flutter/material.dart';

class LoginSignuppage extends StatelessWidget {
  const LoginSignuppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 70.0),
              //Image
              Image.asset("assets/images/Welcome.png"),
              //Text of welcome Start here
              Text(
                "Welcome Back👋",
                style: TextStyle(
                  color: Color.fromARGB(255, 80, 109, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
                ),
                Text(
                "I am happy to see You can continue to \nlogin for manage your trades",
                style: TextStyle(
                  color: Color.fromARGB(255, 78, 78, 78),
                  //fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),
                ),


              //Textfiled for the login page
              SizedBox(height: 60.0),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 325),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon:Icon(Icons.person),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3,color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3,color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Username",
                    hintText: "Enter UserName",
                    hoverColor: Colors.blue
                  ),
                  
                ),
              ),
              SizedBox(height: 30.0),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 325),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon:Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3,color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3,color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    labelText: "Password",
                    hintText: "Please Enter Password",
                    hoverColor: Colors.blue
                  ),

                ),
              ),
              //Adding Login Button Here

            ],
          ),
        ),
      ),
    );
  }
}