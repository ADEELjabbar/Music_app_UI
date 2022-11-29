import 'package:flutter/material.dart';
import 'package:music_app/screens/albums_arch.dart';
import 'package:music_app/screens/albums_g_arch.dart';
import 'package:music_app/screens/bands_arch.dart';
import 'package:music_app/screens/playlist_all_songs.dart';
import 'package:music_app/screens/playlist_arch.dart';
import 'package:music_app/screens/signup_screen.dart';
import 'package:music_app/widgets/drawer.dart';
import 'package:music_app/widgets/practice.dart';
import 'package:provider/provider.dart';

import '../providers/playlist_pro.dart';
import 'Cat_g_arc.dart';
import 'Categories_arch.dart';
import 'bands_list_arch.dart';

class HomeScreen extends StatefulWidget {

  static const RouteName="/home_sc";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
@override
  void didChangeDependencies() {
  final obj=Provider.of<PlayList_Pro>(context, listen: false).playGet;

  // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final hei=MediaQuery.of(context).size.height;
    return Scaffold(
     resizeToAvoidBottomInset: false,
      key: _key,
      appBar: AppBar(

        backgroundColor:Color.fromRGBO(31, 31, 31, 1),
        leading: GestureDetector(
            onTap:(){
              _key.currentState!.openDrawer();
           // Navigator.pushNamed(context, Drawer_Sc.RouteName);
            },
            child: Icon(Icons.menu, color:Color.fromRGBO(236, 197, 0, 1), )),
        title: Padding(
          padding: const EdgeInsets.only(right: 48.0),

          child: Center(
            child: Text("Home", style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1), fontSize: 22, fontWeight: FontWeight.bold ),
            ),
          ),
        ),
      ),

      drawer: Drawer_Sc(),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          width: wid,
          height: hei,
          color:Color.fromRGBO(31, 31, 31, 1),
          child:  SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              Center(child: Image.asset("assets/headphones.png", height: 100, width: 100,)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Find the best music", style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 13.0, right:14 ),
                child: Row(
  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child:Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(


                                borderRadius: BorderRadius.circular(8),

                              ),
                                child:
                Expanded(
                  child: TextField(

                                    decoration: InputDecoration(fillColor: Colors.white, filled: true, hintText: "search", hintStyle:TextStyle(color: Colors.yellow,),
                                   contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(color: Colors.black)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        )

                                    ),
                                  ),
                ),
                              ),
                          ),
                          ),
                    ),
                      // ),


                    // Icon(Icons.search, size: 40, color:Color.fromRGBO(236, 197, 0, 1),
                    // ),
                    //
                    // Icon(Icons.menu, size: 50, color:Color.fromRGBO(236, 197, 0, 1),
    // ),
    //
    //                 ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:[

               Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Categories", style: TextStyle(fontSize: 19, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
              ),
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, Cat_G_Arch.RouteName );
                 },
                 child: Padding(
                   padding: const EdgeInsets.only(right: 16.0),
                   child: Container(width: 60,height: 25,
                       child:Center(child: Text("view all", style: TextStyle(color: Colors.white),)),
                       decoration: BoxDecoration(
                         color:  Color.fromRGBO(236, 197, 0, 1),
                         borderRadius: BorderRadius. all(Radius.circular(20)
                         ),)
                   ),
                 ),
               ),


  ] ),
Categories_Arc(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[

                    Padding(
                       padding: const EdgeInsets.all(15.0),
                      child: Text("Albums", style: TextStyle(fontSize: 19, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Albums_G_Arc.RouteName );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(width: 60,height: 25,
                            child:Center(child: Text("view all", style: TextStyle(color: Colors.white),)),
                            decoration: BoxDecoration(
                              color:  Color.fromRGBO(236, 197, 0, 1),
                              borderRadius: BorderRadius. all(Radius.circular(20)
                              ),)
                        ),
                      ),
                    ),

                  ] ),
Albums_Arch(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Popular Bands", style: TextStyle(fontSize: 19, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Bands_List_Arch.RouteName );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(width: 60,height: 25,
                      child:Center(child: Text("view all", style: TextStyle(color: Colors.white),)),
                      decoration: BoxDecoration(
                        color:  Color.fromRGBO(236, 197, 0, 1),
                        borderRadius: BorderRadius. all(Radius.circular(20)
                        ),)
                  ),
                ),
              ),

            ],
        ),
              Popular_bands_arch(),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Playlist", style: TextStyle(fontSize: 19, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, PlayList_All.RouteName );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(width: 60,height: 25,
                            child:Center(child: Text("view all", style: TextStyle(color: Colors.white),)),
                            decoration: BoxDecoration(
                              color:  Color.fromRGBO(236, 197, 0, 1),
                              borderRadius: BorderRadius. all(Radius.circular(20)
                              ),)
                        ),
                      ),
                    ),

                  ] ),

Container(
    // height: 400,
    child: Playlist_Arc()),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
