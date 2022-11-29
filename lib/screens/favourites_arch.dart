import 'package:flutter/material.dart';
import 'package:music_app/design_screens/favourites_design.dart';
import 'package:music_app/providers/favourites_pro.dart';
import 'package:music_app/providers/playlist_pro.dart';
import 'package:music_app/screens/main_home.dart';
import 'package:provider/provider.dart';

class Favourites_Arch extends StatelessWidget {
static const RouteName="/favourite";
  const Favourites_Arch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final objFav=Provider.of<PlayList_Pro>(context).findById;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Main_Home.RouteName);
            },
            child: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1))),
        title:Center(child:
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("Favourites", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:   Container(
          color: Colors.black,
          child: Column(

            children: [
              Row(
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

                          decoration: InputDecoration(fillColor: Colors.white, filled: true, hintText: "search", hintStyle:TextStyle(color: Colors.yellow),
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

                  Icon(Icons.menu, size: 50, color:Color.fromRGBO(236, 197, 0, 1),
                  ),
                ],
              ),
              Expanded(
                child:   ListView.builder(
                    itemCount: objFav.length,
                    itemBuilder: (BuildContext context, int index)=>
                        Favourites_design( songPic: objFav[index].songPic, songAddress: objFav[index].songAddress, songName: objFav[index].SongName )),
              )

            ],

          ),
        ),
      ),
    );
  }
}
