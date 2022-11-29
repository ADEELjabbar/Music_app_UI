import 'dart:ui';

import 'package:flutter/material.dart';

import '../screens/categories_songs.dart';

class Cat_G_Design extends StatelessWidget {
  final String name, pic;
  final List<String> songs;

    Cat_G_Design({ required this.name, required this.pic, required this.songs});

  @override
  Widget build(BuildContext context) {
    return
    // Container(
    //         width: 100,
    //         height: 100,
    //   // 250
    //   // color: Colors.yellow,
    //         child: Column(
    //           children: [
    //             Container(
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                 ),
    //
    //                 width: 200,
    //
    //                 height: 180,
    //                 child: ClipRRect(
    //                     borderRadius: BorderRadius.all(Radius.circular(10)),
    //                     child: Image.asset("assets/"+pic, fit:BoxFit.cover,))),
    //             Text(name, style: TextStyle(color: Colors.white),),
 GestureDetector(
   onTap: (){
     Navigator.pushNamed(context, Categories_Songs_Sc.RouteName, arguments:{
       "catName": name,
       "catPic":pic,
       "songsList":songs
     } );
   },
   child: GridTile(
     child: ClipRRect(
         child: Image.asset("assets/"+pic, fit:BoxFit.cover,)),
     footer:GridTileBar(
       backgroundColor: Colors.black54,
      title: Center(child: Text(name, style: TextStyle(color: Colors.white),)),
     ),
   ),
 );
              // ],
            // ),
    //

    // );

  }
}
