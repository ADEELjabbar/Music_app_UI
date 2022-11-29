import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/screens/categories_songs.dart';

class Categories_Design extends StatelessWidget {
final String name, pic;
   final  songs;
   final isFavourite;
   Categories_Design({ required this.name, required this.pic, required this.songs,required this.isFavourite}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Categories_Songs_Sc.RouteName, arguments:{
           "catName": name,
            "catPic":pic,
            "songsList":songs,
            "isFavourite":isFavourite,
          } );
        },
        child: Container(
  width: 150,
  height: 150,
  // color: Colors.yellow,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                width: 150,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset("assets/"+pic, fit:BoxFit.cover,))),
            Text(name, style: TextStyle(color: Colors.white, fontSize: 18, ),),
          ],
        )
        ),
      ),
    );
  }
}
