import 'package:flutter/material.dart';
import 'package:music_app/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../design_screens/cat_grid_design.dart';
import '../providers/albums_provider.dart';

class Cat_G_Arch extends StatelessWidget {

  static const RouteName="/cat";

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;

    final albumsList=Provider.of<Categories_Provider>(context).catGet;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1)),
        title:Center(child:
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("Categories", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
        child: Container(
         color: Colors.black,
          child : Column(

            children:[

        Padding(
          padding: const EdgeInsets.only(bottom: 38),
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
                          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
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
],
    ),
        ),
            Expanded(

            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,

                  ) , itemBuilder: (BuildContext context, int index) =>Cat_G_Design(name: albumsList[index].name , pic:albumsList[index].pic , songs: albumsList[index].songsList,),
                  itemCount: albumsList.length,
                  ),
          ),


      ],
                  ),
                  ),
      ),
     // ],

    );
    // ),
    // );

  }
  
}
