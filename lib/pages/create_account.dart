import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
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
                          hintText: "Enter  First Name + Last Name",
                          hoverColor: Colors.blue
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 325),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
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
                          hintText: "Enter Email",
                          hoverColor: Colors.blue
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 325),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number cannot be empty";
                          }else if(value.length < 10){
                            return "Phone Number length is less than 10";
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
      )
    );
    
  }
}