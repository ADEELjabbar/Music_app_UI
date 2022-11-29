import 'package:flutter/cupertino.dart';
import 'package:music_app/models/trending_model.dart';

class Trending_pro extends ChangeNotifier{
  final List<Trending_Model> _trendingList=[
Trending_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
    Trending_Model(SongName: "Yeh Wattan Tumhara Hai", songPic: "trending1.jpg", songAddress: "dummy"),
Trending_Model(SongName: "Dill Dill Pakistan", songPic: "trending2.jpg", songAddress: "dummy"),
Trending_Model(SongName: "Dill Dill Pakistan", songPic: "trending3.jpg", songAddress: "dummy"),
  ];
List<Trending_Model> get trendingGet{
  return[..._trendingList];
}
}