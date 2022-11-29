import 'package:flutter/material.dart';
import 'package:music_app/design_screens/recently_design.dart';
import 'package:music_app/providers/recently_pro.dart';
import 'package:provider/provider.dart';

class Recently_Arch extends StatelessWidget {
  static const RouteName="/recently";

  @override
  Widget build(BuildContext context) {
    final obj=Provider.of<Recently_Pro>(context).recentlyGet;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1)),
        title:Center(child:
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("TRENDING", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:   Column(

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
                  itemCount: obj.length,
                  itemBuilder: (BuildContext context, int index)=>Recently_Design(songName: obj[index].SongName, songPic: obj[index].songPic, songAddress: obj[index].songAddress)),
            )

          ],

        ),
      ),
    );
  }
}
