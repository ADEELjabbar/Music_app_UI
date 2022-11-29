import 'package:flutter/material.dart';
import 'package:music_app/design_screens/playlist_design.dart';
import 'package:music_app/providers/playlist_pro.dart';
import 'package:provider/provider.dart';

class Playlist_Arc extends StatelessWidget {
 static const RouteName="/Playlist";

   @override
  Widget build(BuildContext context) {

    final obj=Provider.of<PlayList_Pro>(context, listen: false).playGet;
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Container(
              height: obj.length*70+40,
              child:
              Expanded(
                child:   ListView.builder(

      physics: NeverScrollableScrollPhysics(),
                    itemCount: obj.length,
                    itemBuilder: (BuildContext context, int index)=>Playlist_Design(songName: obj[index].SongName, songPic: obj[index].songPic, songAddress: obj[index].songAddress, isFavourite: obj[index].isFavourite, )),


        ),
            ),

    );

  }
}
