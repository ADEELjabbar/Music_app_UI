import 'package:flutter/material.dart';
import 'package:music_app/models/albums_model.dart';

class Albums_Provider with ChangeNotifier{
  final List<Albums_Model> _albumsList=[
    Albums_Model(name: "National", pic:"national.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Albums_Model(name: "Sad", pic:"sad_songs.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Albums_Model(name: "Happy", pic:"happy_songs.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Albums_Model(name: "Friendship ", pic:"friendship_pic.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    // Albums_Model(name: "Electric", pic:"electric.jpg" , songsList: ["yeh watan hamara hai", "millat ka pasban hai", "yeh putter hattan ny ni wikdy", ]),

  ];
  List<Albums_Model> get albumsGet{
    return [..._albumsList];
  }
}