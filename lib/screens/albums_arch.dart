import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design_screens/albums_design.dart';
import '../providers/albums_provider.dart';

class Albums_Arch extends StatelessWidget {
  const Albums_Arch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final albumsList=Provider.of<Albums_Provider>(context).albumsGet;
    return Container(
      width: wid,
      height: 180,
      // color: Colors.blue,
      child: Expanded(

        child  : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: albumsList.length,
            itemBuilder: (BuildContext context, int index) => Albums_design(name: albumsList[index].name, pic: albumsList[index].pic, songs: albumsList[index].songsList,

            )),
      ),
    );

  }

}
