import 'package:flutter/cupertino.dart';

import '../models/popular_bands_model.dart';

class Popular_Bands_Pro extends ChangeNotifier{
  final List<Popular_Bands_Models> _bandsList=[
    Popular_Bands_Models(name: "Awaz", pic:"awaz.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg", ]),
    Popular_Bands_Models(name: "Junoon", pic:"junoon.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Salman","Ali Azmat" , "Nusrat Hussain","Taylor" ,], artistsPics: ["salman.jpg","ali_azmat.jpg", "nusrat_hussain.jpg", "taylor.jpg"]),
    Popular_Bands_Models(name: "Soch", pic:"soch.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg",]),
    Popular_Bands_Models(name: "Kashmir", pic:"kashmir.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg",]),
    Popular_Bands_Models(name: "Soch", pic:"soch.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg",]),
    Popular_Bands_Models(name: "Kashmir", pic:"kashmir.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg",]),
    Popular_Bands_Models(name: "Soch", pic:"soch.jpg" , songsList: ["Aye Rahy", "Tu_Salamat", "Dil-Dil", ], artists: ["Atif", "Rahat Fateh", "Ibrar",], artistsPics: ["atif.jpg", "rahat.jpg", "ibrara.jpg",]),

  ];
  List<Popular_Bands_Models> get bandsGet{
    return [..._bandsList];
  }

}