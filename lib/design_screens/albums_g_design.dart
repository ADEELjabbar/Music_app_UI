import 'package:flutter/material.dart';
import 'package:music_app/screens/albums_songs.dart';

class Albums_G_Design extends StatelessWidget {
  final String name, pic;
  final List<String> songs;

  const Albums_G_Design({required this.name,required this.pic,required this.songs}) ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Albums_Songs_Sc.RouteName, arguments:{
          "albumsName": name,
          "albumsPic":pic,
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

  }

}
