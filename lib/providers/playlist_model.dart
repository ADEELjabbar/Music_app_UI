// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PlayList_Model with ChangeNotifier {
  final String SongName;
  final String songPic;
  final String songAddress;
  bool isFavourite;

  PlayList_Model(
      { required this.SongName, required this.songPic, required this.songAddress, this.isFavourite = false });

  void setisFavourite(){
    isFavourite = !isFavourite;
     notifyListeners();
  }

}


// class PlayList_Model with ChangeNotifier{
//   final String SongName;
//   final String songPic;
//   final String songAddress;
//   bool isFavourite;
//
//   PlayList_Model(this.SongName,this.songPic, this.songAddress,{ this.isFavourite=false});
//
//   void setisFavourite(){
//     isFavourite = !isFavourite;
//      notifyListeners();
//   }
//
// }