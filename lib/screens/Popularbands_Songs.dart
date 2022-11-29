import 'package:flutter/material.dart';

import '../design_screens/Songs_list.dart';

class Popular_B_Songs extends StatelessWidget {
  static const RouteName="/Popular_b_Songs";
  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final bandData=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bandNam=bandData["name"];
    final bandSongs=bandData["songsList"];
    final pic=bandData["pic"];
   final bandArtists=bandData["artists"];
    final artistsPics=bandData["artistspics"];
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Colors.black,
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Text(bandNam.toString(), style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
        )),),

      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          color:Colors.black,
          child: Padding(
            padding:  EdgeInsets.only(top: 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(child: Text(bandNam.toString(), style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Container(
                      width: wid,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset("assets/"+pic, fit: BoxFit.fill,)),
                    ),
                  ),
         Padding(
           padding: const EdgeInsets.only(top:20, left: 14, bottom: 4),
           child: Text("Artists" , style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 12.0, right:12, top: 8, bottom: 8 ),
           child: Container(
height: 105,
               child: Expanded(
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: bandArtists.length , itemBuilder: (BuildContext context, int index)=>Container(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
height: 70,
          width: 70,
          decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
          ),
          child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset("assets/"+artistsPics[index].toString())),
        ),
      ),
      Text(bandArtists[index].toString(), style: TextStyle(color: Colors.white),)
    ],
  ),
                 ),),
               ),
           ),
         ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child:   Text("Songs",  style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),

                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: bandSongs?.length ,
                        itemBuilder: (BuildContext context, int index)=>Songs_List(Songs: bandSongs![index], Pics: pic, Name: bandNam, )),
                  )
                  ,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
