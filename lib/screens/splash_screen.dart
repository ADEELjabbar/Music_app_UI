import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/widgets/first_screen.dart';

class SplashSc extends StatefulWidget {

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushNamed(context, FirstSc.RouteName);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: wid,
        color: Colors.black,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
Image.asset("assets/headphones.png",),
     Image.asset("assets/musicstudio.png",),
          ],
        ),
      ),
    );
  }
}
