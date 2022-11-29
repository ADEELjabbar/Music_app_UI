import 'package:flutter/material.dart';
import 'package:music_app/providers/popular_bands_provider.dart';
import 'package:provider/provider.dart';

import '../design_screens/bands_design.dart';

class Popular_bands_arch extends StatelessWidget {
  const Popular_bands_arch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final bandsList=Provider.of<Popular_Bands_Pro>(context).bandsGet;
    return Container(
      width: wid,
      height: 180,
      // color: Colors.blue,
      child: Expanded(

        child  : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bandsList.length,
            itemBuilder: (BuildContext context, int index) => Popular_Bands_Design(name: bandsList[index].name, pic: bandsList[index].pic, songs: bandsList[index].songsList, artists: bandsList[index].artists, artistspics: bandsList[index].artistsPics,

            )),
      ),
    );

  }
}
