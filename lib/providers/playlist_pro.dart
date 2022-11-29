import 'package:flutter/cupertino.dart';
import 'package:music_app/providers/playlist_model.dart';



class PlayList_Pro extends ChangeNotifier{

    List<PlayList_Model> _playList=[
   //  PlayList_Model("Aye Rahy", "electric.jpg",  "dummy",),
   //  PlayList_Model( "Tu_Salamat", "trending1.jpg",  "dummy"),
    //  PlayList_Model(SongName:  "Dil-Dil", songPic: "trending2.jpg", songAddress: "dummy"),

     PlayList_Model(SongName: "Aye Rahy", songPic: "electric.jpg", songAddress: "dummy",),
     PlayList_Model(SongName: "Tu_Salamat", songPic: "trending1.jpg", songAddress: "dummy"),
     PlayList_Model(SongName:  "Dil-Dil", songPic: "trending2.jpg", songAddress: "dummy"),


   ];

  List<PlayList_Model> get playGet{
    return[..._playList];
  }

   List<PlayList_Model> get findById{
  return  _playList.where((obj) => obj.isFavourite).toList();
  }
}