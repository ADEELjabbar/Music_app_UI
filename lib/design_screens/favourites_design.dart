import 'package:flutter/material.dart';

class Favourites_design extends StatelessWidget {

  final String songName, songPic, songAddress;

  Favourites_design({Key? key, required this.songName, required this.songPic, required this.songAddress}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10), ), border: Border.all(color: Colors.grey),   color: Colors.black,),
        child: Center(
          child: ListTile(

            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  child: Image.asset("assets/"+songPic, fit: BoxFit.cover,)),
            ),
            title: Text(songName, style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),
            trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),),
          ),
        ),
      ),
    );
  }

}
