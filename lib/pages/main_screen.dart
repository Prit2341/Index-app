import 'package:flutter/material.dart';
import 'package:indexapp/util/route.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 80, 109, 255),
      ),
    );
  }
}