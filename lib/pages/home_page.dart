import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:indexapp/pages/add_land.dart';
import 'package:indexapp/pages/main_screen.dart';
import 'package:indexapp/pages/profile_page.dart';
import 'package:indexapp/pages/treading_page.dart';
import 'package:indexapp/pages/wallet_page.dart';
import 'package:indexapp/util/route.dart';
import 'package:pandabar/pandabar.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String page = 'Gray';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PandaBar(
        backgroundColor: Color.fromARGB(255, 238, 239, 252),
        buttonColor: Color.fromARGB(255, 80, 109, 255),
        fabColors: [
          Color.fromARGB(255, 80, 109, 255),
          Color.fromARGB(255, 80, 109, 255),
        ],
        buttonData: [
          PandaBarButtonData(
            id: 'Home',
            icon: Icons.home,
            title: 'Home'
          ),
          PandaBarButtonData(
            id: 'Search',
            icon: Icons.search_rounded,
            title: 'Serach'
          ),
          PandaBarButtonData(
            id: 'wallet',
            icon: Icons.account_balance,
            title: 'wallet'
          ),
          PandaBarButtonData(
            id: 'Profile',
            icon: Icons.person,
            title: 'Profile'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          Navigator.pushNamed(context, MyRoute.AddPageRoute);
        },
      ),
      body: Builder(
        builder: (context) {

          switch (page) {
            case 'Home':
              return MainScreen();
            case 'Search':
              return TreadingPage();
            case 'wallet':
              return WalletPage();
            case 'Profile':
              return ProfilePage();
            default:
              return MainScreen();
              
          }

        },
      ),
    );
    }
}

