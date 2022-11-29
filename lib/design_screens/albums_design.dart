import 'package:flutter/material.dart';

import '../screens/albums_songs.dart';

class Albums_design extends StatelessWidget {
 static const RouteName="/albums_design";

  final String name, pic;
  final  songs;

   Albums_design({Key? key,required this.name,required this.pic,required this.songs}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Albums_Songs_Sc.RouteName, arguments:{
            "albumsName": name,
            "albumsPic":pic,
            "songsList":songs
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
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18),),
              ],
            )
        ),
      ),
    );
  }

}
