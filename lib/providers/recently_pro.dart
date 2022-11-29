import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:music_app/models/recently_model.dart';

class Recently_Pro extends ChangeNotifier{
  final List<Recently_Model> _recentlyList=[
    Recently_Model(SongName: "Dill Dill Pakistan", songPic: "electric.jpg", songAddress: "dummy"),
    Recently_Model(SongName: "Yeh Wattan Tumhara Hai", songPic: "trending1.jpg", songAddress: "dummy"),
    // Trending_Model(SongName: "Dill Dill Pakistan", songPic: "trending2.jpg", songAddress: "dummy"),

  ];
  List<Recently_Model> get recentlyGet{
    return[..._recentlyList];
  }

}