import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indexapp/util/route.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';





class AddingItem extends StatefulWidget {
  const AddingItem({Key? key}) : super(key: key);

  @override
  State<AddingItem> createState() => _AddingItemState();
}

class _AddingItemState extends State<AddingItem> {
  Future<firebase_storage.UploadTask> uploadFile(File file) async {  
    if (file == null) {
      print("No File Is Created");
      return null!;  
    } 

    firebase_storage.UploadTask uploadTask;  
    
    // Create a Reference to the file  
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance  
    .ref()  
        .child('files')  
        .child('/some-file.pdf');  
    
    final metadata = firebase_storage.SettableMetadata(  
        contentType: 'file/pdf',  
        customMetadata: {'picked-file-path': file.path});  
    print("Uploading..!");  
    
    uploadTask = ref.putData(await file.readAsBytes(), metadata);  
    
    print("done..!");  
    return Future.value(uploadTask);  
}
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
                        Container(
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset: Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                          ]
                        ),
                          height: 200,
                          width: 370,
                          child: Center(
                            child: Icon(Icons.image),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                          child: Column(
                            children: [
                              TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.size5),
                                hintText: '2900sq',
                                labelText: 'Size',
                              ),
                              onChanged: (value) {
                                size = value;
                              },
                              validator: (value) {
                                return null;
                              },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(255, 80, 109, 255),
                                prefixIcon: Icon(Iconsax.level),
                                hintText: '',
                                labelText: 'Water Level',
                              ),
                              onChanged: (value) {
                                size = value;
                              },
                              validator: (value) {
                                return null;
                              },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(255, 80, 109, 255),
                                prefixIcon: Icon(Iconsax.buliding),
                                hintText: 'Rural/Urban',
                                labelText: 'Area',
                              ),
                              onChanged: (value) {
                                size = value;
                              },
                              validator: (value) {
                                return null;
                              },
                      ),
                      SizedBox(height: 20.0),
                      Text(""),
                      Container(
                      margin: EdgeInsets.all(0),
                      height: 50.0,
                      width: 300.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () async{
                          final path = await FlutterDocumentPicker.openDocument();
                          print(path);
                          File file = File(path!);
                          firebase_storage.UploadTask task = await uploadFile(file);
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        textColor: Colors.black,
                        child: Text("Upload File",
                            style: TextStyle(fontSize: 15)),
                      ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50.0,
                        width: 390,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color.fromARGB(255, 80, 109, 255))),
                          onPressed: () {
                            
                          },
                          padding: EdgeInsets.all(10.0),
                          color: Color.fromARGB(255, 80, 109, 255),
                          textColor: Colors.white,
                          child: Text("Add Land",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),

                            ],
                          ),
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