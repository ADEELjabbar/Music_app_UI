import 'package:flutter/material.dart';
import 'package:music_app/design_screens/bands_list_design.dart';
import 'package:provider/provider.dart';

import '../providers/popular_bands_provider.dart';

class Bands_List_Arch extends StatelessWidget {
  static const RouteName="/bands_list";
  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final bandsList=Provider.of<Popular_Bands_Pro>(context).bandsGet;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      leading: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1)),
        title:
        Center(child:
    Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("BANDS", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left:10, right: 10 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          // color: Colors.blue,
          children:[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text("Popular",  style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
            Expanded(

            child  : ListView.builder(

                scrollDirection: Axis.vertical,
                itemCount: bandsList.length,
                itemBuilder: (BuildContext context, int index) =>Bands_List_design(name: bandsList[index].name, pic: bandsList[index].pic, songs: bandsList[index].songsList, artists: bandsList[index].artists,  artistspics: bandsList[index].artistsPics,)
                )),
             ],),
        ),
      ),
    );

  }
}
