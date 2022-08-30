import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';

import 'package:indexapp/util/route.dart';



class AddingItem extends StatefulWidget {
  const AddingItem({Key? key}) : super(key: key);

  @override
  State<AddingItem> createState() => _AddingItemState();
}

class _AddingItemState extends State<AddingItem> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var size;
  late String soilQuality;
  var waterlevel;
  late String desc;
  late String area;
  CollectionReference users = FirebaseFirestore.instance.collection('LandData');

  Future<void> addUser() {
    final User user = auth.currentUser!;
    final userid = user.uid;
      // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Size': size, // John Doe
          'SoilQuality': soilQuality, // Stokes and Sons
          'WaterLevel': waterlevel,
          'Description' : desc,
          'Area':area ,// 42
          'UID' : userid
          })
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to add user: $error"));
    }
  
  File? image;
  Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image == null) return;
  final imageTemp = File(image.path);
  setState(() => this.image = imageTemp);
      } on PlatformException catch(e) {
        print('Failed to pick image: $e');
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formkey,
                  child: Center(
                    child: Column(
                      children: [
                        AppBar(
                          title: Text("Add land"),
                          centerTitle: true,
                          backgroundColor: Color.fromARGB(255, 80, 109, 255),
                        ),
                        SizedBox(height: 20.0),
                        Material(
                                elevation: 5,
                                color: Color.fromARGB(255, 209, 209, 209),
                                borderRadius: BorderRadius.circular(25),
                                child: MaterialButton(
                                  onPressed: () async{
                                    pickImage();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 150,
                                    width: 290,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image),
                                          SizedBox(height: 20.0),
                                          Text(
                                            " Add Images",
                                            style: TextStyle(
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.black
                                            ),
                                            ),
                                            image!= null ? Image.file(
                                        image!,
                                        width: 150,
                                        height: 290,
                                        fit: BoxFit.fitHeight,
                                      ) : Text('')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        
                              ),
                              SizedBox(height: 30.0),
                              ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 325),
                              child: TextFormField(
                                onChanged: (value){
                                  size = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "This Filed cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.landscape),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  labelText: "Size of the land",
                                  hintText: "Enter Size in Squre feet",
                                  hoverColor: Colors.blue
                                ),
                                
                              ),
                            ),
                    
                            SizedBox(height: 20.0),
                              ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 325),
                              child: TextFormField(
                                onChanged: (value){
                                  soilQuality = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.high_quality),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  labelText: "Soil Quality of Land",
                                  hintText: "",
                                  hoverColor: Colors.blue
                                ),
                                
                              ),
                            ),
                            SizedBox(height: 20.0),
                              ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 325),
                              child: TextFormField(
                                onChanged: (value) {
                                  waterlevel = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.water),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  labelText: "Water level of the land",
                                  hintText: "Enter Size in Squre feet",
                                  hoverColor: Colors.blue
                                ),
                                
                              ),
                            ),
                            SizedBox(height: 20.0),
                              ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 325),
                              child: TextFormField(
                                onChanged: (value){
                                  desc = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.source_rounded),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  labelText: "Surrounding of the land",
                                  hintText: "",
                                  hoverColor: Colors.blue
                                ),
                                
                              ),
                            ),
                            SizedBox(height: 20.0),
                              ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 325),
                              child: TextFormField(
                                onChanged: (value) {
                                  area = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Username cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.business_outlined),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 3,color: Color.fromARGB(255, 80, 109, 255)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  labelText: "Area of the land",
                                  hintText: "Rurle/urban",
                                  hoverColor: Colors.blue
                                ),
                                
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Material(
                              elevation: 5,
                              color: Color.fromRGBO(80, 109, 255, 1),
                              borderRadius: BorderRadius.circular(17),
                              child: MaterialButton(
                                onPressed: () {
                                if(_formkey.currentState!.validate()){
                                  addUser();
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
                                          "Add Land",
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}