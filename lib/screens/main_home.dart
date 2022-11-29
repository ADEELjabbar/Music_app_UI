import 'package:flutter/material.dart';
import 'package:music_app/screens/Trending_arch.dart';
import 'package:music_app/screens/favourites_arch.dart';
import 'package:music_app/screens/home_sc.dart';
import 'package:music_app/screens/profile_sc.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class Main_Home extends StatefulWidget {
 static const RouteName="/main_home";
  @override
  State<Main_Home> createState() => _Main_HomeState();
}

class _Main_HomeState extends State<Main_Home> {
  int select=0;

  List<Widget> screens=[
  HomeScreen(),
    Trending_Arch(),
    Favourites_Arch(),
    Profile_Sc(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      // appBar: AppBar(
        // backgroundColor: Colors.black,
        // backgroundColor: Colors.black,
        // Color.fromRGBO(236, 197, 0, 1),

      // ),
      body: screens[select],
      bottomNavigationBar:  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(236, 197, 0, 1),
        selectedIconTheme: IconThemeData(color: Colors.black, size: 35),
        currentIndex: select,
        onTap: (int index){
          setState(() {
            select=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.trending_down),label: "",  ),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),

    ); }
}
