import 'package:flutter/material.dart';

import '../screens/Popularbands_Songs.dart';

class Bands_List_design extends StatelessWidget {
  final name;
  final pic;
  final  songs;
  final artists;
  final artistspics;

   Bands_List_design({required this.name, required this.pic, required this.songs, required this.artists, required this.artistspics});
  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12.0),
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
          child: Stack(
            children: [
              Container(
                width: wid,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/"+pic, fit: BoxFit.fill,)),
              ),
              Positioned(
                  left: 15,
                  bottom: 25,
                  child: Text(name, style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold ),)),
Positioned(
    left: 15,
    bottom: 3,

    child:   Row(children: [

        Text("Rating", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 15, ),),
    SizedBox(width: 10, ),
    Icon(Icons.star, color:  Color.fromRGBO(236, 197, 0, 1),),
    Icon(Icons.star, color:  Color.fromRGBO(236, 197, 0, 1),),
    Icon(Icons.star, color:  Color.fromRGBO(236, 197, 0, 1),),
    Icon(Icons.star, color:  Colors.white),
  ],),
)
            ],
          ),
        ),
      ),
    );
  }
}
