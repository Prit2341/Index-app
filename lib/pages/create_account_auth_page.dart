import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indexapp/pages/create_account.dart';
import 'package:indexapp/pages/home_page.dart';
import 'package:indexapp/pages/main_login_signup_page.dart';
import 'package:provider/provider.dart';
class CreateUserAuthPage extends StatelessWidget {
  const CreateUserAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if (snapshot.hasData) {
            return HomePage();
          }else if (snapshot.hasError) {
            return Center(child: Text("Somthing Went Wrong"));
          }else{
          return CreateAccount();
          }
        },
      ),
    );
  }
}