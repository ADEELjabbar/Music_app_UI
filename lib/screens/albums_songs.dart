import 'package:flutter/material.dart';

import '../design_screens/Songs_list.dart';

class Albums_Songs_Sc extends StatelessWidget{
  static const RouteName="/albums_songs";
  const Albums_Songs_Sc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final albumsData=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final albumNam=albumsData["albumsName"];
    final albumSongs=albumsData["songsList"];
    final albumPic=albumsData["albumsPic"];
    return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Text(albumNam.toString(), style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
        )),),

      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          color:Colors.black,
          child: Padding(
            padding:  EdgeInsets.only(top: 15.0, left: 13, right: 13),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(child: Text(catNam.toString(), style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),)),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
              children: [
              Expanded(
              child: Container(

              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
          ),
          child:Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

              ),
              child: TextField(

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    fillColor: Colors.white, filled: true, hintText: "search", hintStyle:TextStyle(color: Colors.yellow),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )

                ),
              ),
          ),
        ),

      ),
      // Icon(Icons.search, size: 40, color:Color.fromRGBO(236, 197, 0, 1),
      // ),

      // Icon(Icons.menu, size: 50, color:Color.fromRGBO(236, 197, 0, 1),
      // ),
      ],
    ),
            ),



    Expanded(
                  child: ListView.builder(
                      itemCount: albumSongs?.length ,
                      itemBuilder: (BuildContext context, int index)=>Songs_List(Songs: albumSongs![index], Pics: albumPic, Name: albumNam, )),
                )
                ,
              ],
            ),
          ),
        ),
      ),
    );

  }
}
