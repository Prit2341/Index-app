import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indexapp/firebase_auth/google_sign_in.dart';
import 'package:indexapp/util/route.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
   CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  late String name;
  late String user_number;
  late String email;
  late String password;
  bool showSpinner = false;

  bool isEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return false;
    }
    return true;
  }

  Future registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user1 = await FirebaseAuth.instance.currentUser;

    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((signedInUser) => {
        FirebaseFirestore.instance.collection('Users').doc(signedInUser.user!.uid).set({
          'name':name,
          'Phone Number':user_number,
          'email':email,
        }).then((signedInUser) => {
          Navigator.pushNamed(context, MyRoute.HomePageRoute)
        })
      });
    }catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                      //Image
                Image.asset("assets/images/Create_account.png"),
                SizedBox(height: 50.0),
                Text(
                        "Create New Account",
                        style: TextStyle(
                          color: Color.fromARGB(255, 80, 109, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                        ),
                        SizedBox(height: 30.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 325),
                        child: TextFormField(
                          onChanged: (value){
                            name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty";
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
                            labelText: "Name",
                            hintText: "Preet Mayani",
                            hoverColor: Colors.blue
                          ),
                          
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 325),
                        child: TextFormField(
                          onChanged: (value){
                            email = value;
                          },
                          validator: (value) {
                            if (isEmail(value!) == true) {
                              return null;
                            }else if(value.isEmpty){
                              return "Email cannot Be Empty";
                            }
                            return "Enter Email is not Correct";
                          },
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.mail),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            labelText: "Email",
                            hintText: "example@gmail.com",
                            hoverColor: Colors.blue
                          ),
                          
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 325),
                        child: TextFormField(
                          onChanged: (value){
                            user_number = value;
                          },
                          validator: (value) {
                            int phone_number = value!.length;
                            if (value.isEmpty) {
                              return "Phone Number cannot be empty";
                            }else if(value.length < 10){
                              return "Phone Number length $phone_number is less than 10";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.phone_android_rounded),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            labelText: "Phone Number",
                            hintText: "Enter 10 digit phone Number",
                            hoverColor: Colors.blue
                          ),
                          
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 325),
                        child: TextFormField(
                          onChanged: (value){
                            password = value;
                          },
                          validator: (value) {
                            final alphanumeric = RegExp(r"\w");
                            final special_character = RegExp(r"\W");
                            if(value!.isEmpty) {
                              return "Password Cannot be Empty";
                            }else if(value.length <= 10) {
                              return "Password length is less than 10";
                            } else if (alphanumeric.hasMatch(value) == false) {
                              return "Password must contain letter and number";
                            }else if (special_character.hasMatch(value) == false) {
                              return "Password Must Contain Special Character ";
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
                      SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 325),
                        child: TextFormField(
                          validator: (value) {
                            final alphanumeric = RegExp(r"\w");
                            final special_character = RegExp(r"\W");
                            if(value!.isEmpty) {
                              return "Password Cannot be Empty";
                            }else if(value.length <= 10) {
                              return "Password length is less than 10";
                            } else if (alphanumeric.hasMatch(value) == false) {
                              return "Password must contain letter and number";
                            }else if (special_character.hasMatch(value) == false) {
                              return "Password Must Contain Special Character ";
                            }else if (password != value) {
                              return "Password not same";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.lock_outline_rounded),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            labelText: "Conform Password",
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
                      onPressed: () async{
                        if(_formkey.currentState!.validate()){
                          registerUser();
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
                                "Create Account",
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
                            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                            provider.googlelogin();
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
                      SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      )
    );
    
  }
}