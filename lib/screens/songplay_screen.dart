

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/design_screens/Songs_list.dart';

import 'package:music_app/providers/categories_provider.dart';
// import 'package:music_app/providers/playlist_model.dart';
import 'package:music_app/providers/playlist_pro.dart';
import 'package:music_app/screens/playlist_arch.dart';
import 'package:provider/provider.dart';

import '../providers/playlist_model.dart';
import 'playlist_all_songs.dart';

class Song_Play extends StatefulWidget {
  final String ? Songs;
  final String Pics;
   bool  isFav;
   Song_Play(this.Songs, this.Pics, this.isFav );

  @override
  State<Song_Play> createState() => _Song_PlayState();
}

class _Song_PlayState extends State<Song_Play> {
var result=false;
IconData iconValue= Icons.play_arrow;
var dura;
 String urll="https://open.spotify.com/track/5G8mIxVWTgjBvjKqwtCxpB?si=H5EnyROwTsS9okH06zWHHw";
  AudioPlayer audioPlayer=AudioPlayer();
  AudioCache cache=AudioCache();

 Duration position=Duration();
 Duration songLength=Duration();
@override
  void initState()
   // cache=AudioCache();
   {
     // setAudioPlayer();
     cache=AudioCache(fixedPlayer: audioPlayer);
  // audioPlayer.getDuration().then((value) =>
  //
  // );
     audioPlayer.onDurationChanged.listen((d) {
       setState(() {
         songLength = d;
       });
     });

     audioPlayer.onAudioPositionChanged.listen((value) {
       setState(() {
         position=value;
       });
     });
     audioPlayer.getDuration().then((value) {
       setState(() {
         dura=value;
       });
     });
     // audioPlayer.onPlayerStateChanged.listen((state) {
     //   if (mounted) {
     //     setState(() {
     //       // result = state == PlayerState.playing;
     //     });
     //   }
     // });

   // cache.load("Dil-Dil.mp3");
   // TODO: implement initState
    super.initState();

   }
Future<void> setAudioPlayer() async {
  final player = AudioCache(prefix: "assets/");
  final url = await player.load("Dil-Dil.mp3");
  // audioPlayer.setSourceUrl(url.path);
  // audioPlayer.setReleaseMode(ReleaseMode.stop);
 }

Widget slider() {
   return  Slider  (
  activeColor: Colors.yellow,
   min: 0,
       max: songLength.inSeconds.toDouble(),
       value: position.inSeconds.toDouble(), onChanged: (value){
 setState((){
  position=  Duration(seconds: value.toInt());
  audioPlayer.seek(position);

 });
 });
 }

  @override
  Widget build(BuildContext context) {
final wid= MediaQuery.of(context).size.width;
final hei= MediaQuery.of(context).size.height;
final obj1 =Provider.of<PlayList_Model>(context, listen: false);

return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Songs_List.RouteName);
            },
            child: Icon(Icons.arrow_back, color:Color.fromRGBO(236, 197, 0, 1),)),
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Text(" Now Playing", style: TextStyle(fontSize: 20, color:Color.fromRGBO(236, 197, 0, 1), fontWeight: FontWeight.bold),
          ),
        )),),

      body:Container(
        color: Colors.black,
        width: wid,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
  width:wid*0.9 ,
height: hei*0.3 ,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5)
),

child: ClipRRect(
  borderRadius: BorderRadius.circular(8),

    child: Image.asset("assets/"+widget.Pics, fit: BoxFit.fill,)),
),
  Text(widget.Songs.toString(), style: TextStyle(color:Color.fromRGBO(236, 197, 0, 1), ),),

              slider(),

Padding(
  padding: const EdgeInsets.only(left: 18.0, right: 18),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.center,

    children: [



      Text( (songLength-position).inMinutes.toString()+":"+(songLength-position).inSeconds.remainder(60).toString() , style: TextStyle(

            color: Colors.white

      ),),

      Expanded(child: SizedBox()),

      Text(songLength.inMinutes.toString()+":"+songLength.inSeconds.remainder(60).toString(), style: TextStyle(

            color: Colors.white

      ),),



    ],

  ),
),

              // GestureDetector(
              //   onTap: (){
              //     setState(() {
              //       obj1.setisFavourite();
              //     });
              //   },
              //   child: Icon(
              //     widget.isFav ? Icons.favorite : Icons.info_outline,
              //     color: widget.isFav ? Colors.orange : Colors.blue,
              //   ),
              // ),

                Consumer<PlayList_Model>(builder: (_, prod, child) {
                return IconButton(
                    onPressed: () => prod.setisFavourite(),
                    icon: Icon(
                      prod.isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: prod.isFavourite ? Colors.orange : Colors.grey,
                    ));
              }),
              Padding(
  padding: const EdgeInsets.only(top: 18.0),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      Icon(Icons.skip_previous, size: 45 ,color:Color.fromRGBO(236, 197, 0, 1),),


(result ? GestureDetector(
    onTap: (){
     setState(() {
       audioPlayer.pause();
       result=false;

     });
      },
    child: Icon(Icons.pause, size: 45, color:Color.fromRGBO(236, 197, 0, 1),), ) : GestureDetector(
    onTap: (){
      setState(() {
      audioPlayer.pause();
          cache.play(widget.Songs.toString()+".mp3");
          result=true;

      });
    },
    child: Icon(Icons.play_arrow, size: 45, color:Color.fromRGBO(236, 197, 0, 1),)) ),
            //   if(!result){
            //
            //     setState(() async{
            //      await audioPlayer.pause();
            //       result=false;
            //       iconValue=Icons.pause;
            //
            //     });
            //   }
            //   else{
            //     cache.play("Aye Rahy.mp3");
            //     setState(() {
            //       result=true;
            //       iconValue=Icons.play_arrow;
            //     });
            //   }
            // },
            // child: Icon(iconValue, size: 45, color:Color.fromRGBO(236, 197, 0, 1),)),

      Icon(Icons.skip_next,size: 45, color:Color.fromRGBO(236, 197, 0, 1),),

    ],

  ),
              ),

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

Playlist_Arc(),
            ],
          ),
        ),
      ) ,
    );
  }
}
