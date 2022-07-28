import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indexapp/util/route.dart';

class LoginSignuppage extends StatefulWidget {
   const LoginSignuppage({Key? key}) : super(key: key);

  @override
  State<LoginSignuppage> createState() => _LoginSignuppageState();
}

class _LoginSignuppageState extends State<LoginSignuppage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
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
                    "I am happy to see You can continue\n to login for manage your trades",
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
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.person),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: "Username",
                        hintText: "Enter UserName",
                        hoverColor: Colors.blue
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 325),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Password Cannot be Empty";
                        }else if(value.length < 6) {
                          return "Password is too short";
                        } 
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: "Password",
                        hintText: "Please Enter Password",
                        hoverColor: Colors.blue
                      ),
            
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Material(
                    elevation: 5,
                    color: Color.fromARGB(255, 80, 109, 255),
                    borderRadius: BorderRadius.circular(25),
                    child: MaterialButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          Navigator.pushNamed(context, MyRoute.HomePageRoute);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 290,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
            
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    " or",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 15.0),
                  Material(
                    elevation: 5,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    child: MaterialButton(
                      onPressed: () {
                        
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 290,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google_icon.png"
                              ),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
            
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Don't Have Account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Create account",
                        style: TextStyle(
                          color: Color.fromARGB(255, 80, 109, 255)
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          if(_formkey.currentState!.validate()){
                          Navigator.pushNamed(context, MyRoute.CreateAccountRoute);
                        }
                        }
                      )
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}