import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/favourites_arch.dart';
import 'package:music_app/screens/main_home.dart';
import 'package:music_app/screens/playlist_all_songs.dart';
import 'package:music_app/screens/playlist_arch.dart';
import 'package:music_app/screens/recently_arch.dart';

class Profile_Sc extends StatelessWidget {
  static const RouteName="/profile_Sc";

  @override
  Widget build(BuildContext context) {
  final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Main_Home.RouteName
              );
            },
            child: Icon(Icons.arrow_back,  color:  Color.fromRGBO(236, 197, 0, 1))),
        title:Center(child:
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child:
          Text("Profile", style: TextStyle(color:  Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold )),
        ),
// actions: [Icon(Icons.arrow_back)],
        ),

      ),
      body: Container(
       width: wid,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65),
                    ),
                  child:  ClipRRect(
                      borderRadius: BorderRadius.circular(65),

                      child: Image.asset("assets/boy_profile.jpg", fit: BoxFit.fill,)),
          ),
                ),
              ),
Center(child: Text("User Name", style: TextStyle(color:Color.fromRGBO(236, 197, 0, 1) ),)),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Recently_Arch.RouteName);
                  },
                  child: Container(
                    height: 70,
                    width: wid*0.95,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10), ),


                    ),

                    child: ListTile(

                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            child: Image.asset("assets/jazz2.jpg", fit: BoxFit.cover,)),
                      ),
                      title: Text("Recently Played", style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),

                      // trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),
                      ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Favourites_Arch.RouteName);
                  },
                  child: Container(
                    height: 70,
                    width: wid*0.95,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10), ),


                    ),

                    child: ListTile(

                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            child: Image.asset("assets/headp_pic.jpg", fit: BoxFit.cover,)),
                      ),
                      title: Text("Favourites Songs", style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),

                      // trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),
                    ),
                  ),
                ),
              ),
Padding(
  padding: const EdgeInsets.only(left: 5, top: 25),
  child:   Align(

      alignment: Alignment.topLeft,

      child: Text("Playlists", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color:Color.fromRGBO(236, 197, 0, 1)),))),


              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, PlayList_All.RouteName);
                  },
                  child: Container(
                    height: 70,
                    width: wid*0.95,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10), ),


                    ),

                    child: ListTile(

                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            child: Image.asset("assets/hip_hop_music.png", fit: BoxFit.cover,)),
                      ),
                      title: Text("Playlist 1", style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),

                      // trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),
                    ),
                  ),
                ),
              ),
      Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Container(
                    height: 70,
                    width: wid*0.95,

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10), ),


                    ),

                    child: ListTile(

                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            child: Image.asset("assets/headp_pic.jpg", fit: BoxFit.cover,)),
                      ),
                      title: Text("Playlist 2", style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),

                      // trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),
                    ),
                  ),
                ),

Align(
  alignment: Alignment.topLeft,
  child:   Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child:   Container(

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(5),

        border: Border.all(color: Colors.grey),

      ),

      height: 40,

      width: 130,

      child: Align(
  alignment: Alignment.center,
        child: Text(

          "Settings", style: TextStyle(

          color:Color.fromRGBO(236, 197, 0, 1),

     fontSize: 20, fontWeight: FontWeight.normal  ),



        ),

      ),

    ),
  ),
),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    height: 40,
                    width: 130,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Contact", style: TextStyle(
                          color:Color.fromRGBO(236, 197, 0, 1),
                          fontSize: 20, fontWeight: FontWeight.normal  ),

                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
