import 'package:flutter/material.dart';

import '../screens/songplay_screen.dart';

class Playlist_Design extends StatelessWidget {
  final String songName, songPic, songAddress;
  final bool  isFavourite;
  Playlist_Design({ required this.songName, required this.songPic, required this.songAddress,required this.isFavourite});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Song_Play( songName,  songPic, isFavourite ),
            ),
          );
        },
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
      ),
    );
  }
}
