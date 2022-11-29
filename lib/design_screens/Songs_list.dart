import 'package:flutter/material.dart';
import 'package:music_app/screens/songplay_screen.dart';

class Songs_List extends StatelessWidget {
 static const RouteName="/Songs_list";
  final String ? Songs;
  final String Pics;
  final String Name;
  final bool isFav=false;
  const Songs_List({required this.Songs,required this.Pics,required this.Name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0,),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Song_Play( Songs, Pics, isFav ),
            ),
          );
        },

        child: Container(
          height: 70,
          width: 400,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10), ), border: Border.all(color: Colors.grey),   color: Colors.black,),
          child: Center(
            child: ListTile(

              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    child: Image.asset("assets/"+Pics, fit: BoxFit.cover,)),
              ),
              title: Text(Songs!, style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1),),),
            trailing: Icon(Icons.play_circle_fill, color: Color.fromRGBO(236, 197, 0, 1),),
            ),
          ),
        ),
      ),
    );
  }

}
