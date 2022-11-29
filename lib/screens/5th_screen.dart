
import 'package:flutter/material.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/signup_screen.dart';

class FifthScreen extends StatelessWidget {
  static const RouteName="/5thSc";


  @override
  Widget build(BuildContext context) {

    final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: wid,
        color: Colors.black,

        child:
         Column(
   mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Never Stop Playing",  style: TextStyle( color:Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold),),
Container(
    width: wid,
    height: 400,
    child: Image.asset("assets/fif.png", fit: BoxFit.fill)),
           Padding(
             padding: const EdgeInsets.only(top: 45.0),
             child: GestureDetector(
               onTap: (){
                 Navigator.pushNamed(context, Login_Screen.RouteName);

               },
               child: Container(
                 width: 350,
                 height: 50,
child: Center(child: Text("Login", style: TextStyle(color:Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold) )),
               decoration: BoxDecoration(
               color: Colors.white,
               borderRadius:BorderRadius.all(Radius.circular(20))),

               ),
             ),
           ),

             Padding(
               padding: const EdgeInsets.only(top: 15.0),
               child: GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, Signup_Screen.RouteName);
                 },
                 child: Container(
                   width: 350,
                   height: 50,
                   child: Center(child: Text("Signup", style: TextStyle(color:Color.fromRGBO(236, 197, 0, 1), fontSize: 20, fontWeight: FontWeight.bold) )),
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius:BorderRadius.all(Radius.circular(20))),

                 ),
               ),
             ),



           ],
         ),
       ),

    );
  }
}
