import 'package:flutter/cupertino.dart';
import 'package:music_app/models/favourites_model.dart';
import 'package:music_app/providers/playlist_model.dart';
import 'package:provider/provider.dart';

class Favourites_Pro extends ChangeNotifier{

  final List<Favourites_Model> _listFavourites=[
    Favourites_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
    Favourites_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
    Favourites_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
    Favourites_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
  ];
  List<Favourites_Model> get favouritesGet{
    return[..._listFavourites];
  }
}