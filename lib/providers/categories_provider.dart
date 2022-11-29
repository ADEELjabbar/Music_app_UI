import 'package:flutter/material.dart';
import 'package:music_app/models/categories_model.dart';

class Categories_Provider with ChangeNotifier{
  final List<Categories_Model> _catList=[
    Categories_Model(name: "Hip-Hop", pic:"hip_hop_music.png" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Categories_Model(name: "Jazz-music", pic:"jazz2.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Categories_Model(name: "Rock", pic:"headp_pic.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Categories_Model(name: "Dance", pic:"dance_pic.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),
    Categories_Model(name: "Electric", pic:"electric.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ]),

  ];
  List<Categories_Model> get catGet{
    return [..._catList];

  }
}