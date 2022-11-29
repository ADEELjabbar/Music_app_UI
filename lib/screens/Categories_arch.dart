import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../design_screens/categories_design.dart';

class Categories_Arc extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
final catList=Provider.of<Categories_Provider>(context).catGet;
    return Container(
      width: wid,
      // original
      // height: 220,
     height: 180,
      // color: Colors.blue,
      child: Expanded(

        child  : ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: catList.length,
            itemBuilder: (BuildContext context, int index) => Categories_Design(name: catList[index].name, pic: catList[index].pic, songs: catList[index].songsList, isFavourite: catList[index].isFavourite,

            )),
      ),
    );
  }

}
