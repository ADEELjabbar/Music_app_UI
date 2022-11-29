import 'package:flutter/material.dart';
import 'package:music_app/screens/profile_sc.dart';
import 'package:provider/provider.dart';

import '../design_screens/playlist_design.dart';
import '../providers/playlist_pro.dart';

class PlayList_All extends StatelessWidget {
  static const RouteName="/playlist_all";

  @override
  Widget build(BuildContext context) {
    final obj=Provider.of<PlayList_Pro>(context).playGet;
    return
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Profile_Sc.RouteName);
            },
            child: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1))),
        title:Center(child:
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("Playlist", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),

      ),
        body:
        ListView.builder(

                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: obj.length,
                      itemBuilder: (BuildContext context, int index)=>Playlist_Design(songName: obj[index].SongName, songPic: obj[index].songPic, songAddress: obj[index].songAddress, isFavourite: obj[index].isFavourite, )),






      );

  }
}
