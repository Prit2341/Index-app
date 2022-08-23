import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class AddingItem extends StatefulWidget {
  const AddingItem({Key? key}) : super(key: key);

  @override
  State<AddingItem> createState() => _AddingItemState();
}

class _AddingItemState extends State<AddingItem> {
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
      body: Center(
        child: Container(
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
            ],
          ),
        ),
      ),
      
    );
  }
}