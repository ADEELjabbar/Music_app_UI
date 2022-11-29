import 'package:flutter/material.dart';
import 'package:music_app/design_screens/Songs_list.dart';
import 'package:music_app/screens/main_home.dart';

class Categories_Songs_Sc extends StatelessWidget {
  static const RouteName = "/Categories_Songs";

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery
        .of(context)
        .size
        .width;
    final catData = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    final catNam = catData["catName"];
    final catSongs = catData["songsList"];
    final catPic = catData["catPic"];
 final isFavourite=catData["isFavourite"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Main_Home.RouteName);
            },
            child: Icon(Icons.arrow_back, color: Colors.yellow,)),
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Text(catNam.toString(), style: TextStyle(fontSize: 20,
              color: Color.fromRGBO(236, 197, 0, 1),
              fontWeight: FontWeight.bold),),
        )),),

      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          color: Color.fromRGBO(31, 31, 31, 1),
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 13, right: 13),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                // Center(child: Text(catNam.toString(), style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),)),
                Row(
                children: [
                Expanded(
                child: Container(

                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

              ),
              child: TextField(

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "search",
                    hintStyle: TextStyle(color: Colors.yellow),
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
        ],
      ),

      Padding(
        padding: const EdgeInsets.only(left: 7.0, top: 18, bottom: 10),
        child: Text("Songs", style: TextStyle(fontSize: 20,
            color: Color.fromRGBO(236, 197, 0, 1),
            fontWeight: FontWeight.bold),

        ),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: catSongs?.length,
            itemBuilder: (BuildContext context, int index) =>
                Songs_List(Name: catNam, Pics: catPic, Songs: catSongs[index],)
        ),
      ),
        ],
      ),
    ),)
    ,
    // ],

    // ),    ),

    )
    ,
    )
    ,
    );
  }
}
