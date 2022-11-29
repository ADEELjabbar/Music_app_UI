
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class prac2 extends StatefulWidget {

  @override
  State<prac2> createState() => _prac2State();
}

class _prac2State extends State<prac2> {
AudioPlayer ? audioPlayer;
late AudioCache audioCache;


  Duration pos=Duration();
  Duration dur=Duration();
  late String durat;
@override
  void initState() {

  setState(() {
    audioPlayer=AudioPlayer();
    audioCache=AudioCache(fixedPlayer: audioPlayer);
// audioCache.play('Dil-Dil.mp3');
  });// audioCache.load("assets/");

  audioPlayer!.onDurationChanged.listen((d) {
  setState(() {
    dur=d;
  });
});
   audioPlayer!.onAudioPositionChanged.listen((p){
  setState(() {
    pos=p;
  });
  });
  // TODO: implement initState
    super.initState();
  }
  @override
  // void dispose() {
  // audioPlayer!.dispose();
  // // TODO: implement dispose
  //   super.dispose();
  // }

   void playaud(){

  audioCache.play("Dil-Dil.mp3");
  }
  void stop(){
  audioPlayer!.pause();

  }

  @override
  Widget build(BuildContext context) {
    audioPlayer!.getDuration().then((value) {
      setState(() {
        durat=value.toString();
      });
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border:Border.all(color: Colors.black),
              color: Colors.yellow,

            ),
height: 40,

            // child: Padding(
            //   padding: const EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  elevation: 3,

                  child: TextField(

decoration: InputDecoration(
fillColor: Colors.deepOrange,
  filled: true,
  hintText: "search",
  contentPadding: EdgeInsets.symmetric(vertical: 5 ),
     enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.black,
  ),

),
  focusedBorder: OutlineInputBorder(
borderSide: BorderSide(
  color: Colors.black
)
  )
),
                  ),
                ),
              ),
            ),
          SizedBox(height: 10),
          Material(
            elevation: 4,
            shadowColor: Colors.black,
            color: Colors.black,
            child: TextField(
            decoration:InputDecoration(
              enabledBorder: OutlineInputBorder(

              )
            ),
            ),
          ),
          // )
Slider(
    activeColor: Colors.blue,
    value:pos.inSeconds.toDouble() ,
    min: 0,
    max: dur.inSeconds.toDouble(),
    onChanged: (value){
  pos =Duration(seconds: value.toInt());
    audioPlayer!.seek(pos);
    }),
          GestureDetector(
              onTap: (){
                playaud();
              },
              child: Text("play")),
        Text(dur.toString()),
        Text({dur-pos}.toString()),
        Text(durat),
          GestureDetector(
              onTap: (){
                stop();
              },
              child: Text("Stop")),

        ],
      ),
    )
    ;
  }
}
