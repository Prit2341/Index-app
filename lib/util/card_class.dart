import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Cards extends StatelessWidget {
   Cards({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.white,
      child: SizedBox(
        width: 380,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green[500],
                radius: 70,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/google_icon.png'),
                  radius: 100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "title",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(height: 10),
                Text("Description of the data"),
            ],
          ),
        ),
      ),
    );
  }
}