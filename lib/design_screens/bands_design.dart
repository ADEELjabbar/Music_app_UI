import 'package:flutter/material.dart';
import 'package:music_app/screens/Popularbands_Songs.dart';

class Popular_Bands_Design extends StatelessWidget {
  final name;
  final pic;
  final  songs;
  final artists;
  final artistspics;

  Popular_Bands_Design({ required this.name, required this.pic, required this.songs, required this.artists, required this.artistspics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Popular_B_Songs.RouteName, arguments:{
            "name": name,
            "pic":pic,
            "songsList":songs,
          "artists":artists,
            "artistspics":artistspics,
          } );
        },
        child: Container(
            width: 80,
            height: 100,
            // color: Colors.yellow,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),

                    //previous
                    // width: 150,
                    // height: 130,
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Image.asset("assets/"+pic, fit:BoxFit.cover,))),
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18, ),),
              ],
            )
        ),
      ),
    );

  }
}
