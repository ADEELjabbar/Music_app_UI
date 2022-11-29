import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/2nd_screen.dart';

class FirstSc extends StatelessWidget {
  static const RouteName="/firstSc";

  @override
  Widget build(BuildContext context) {
  final wid=MediaQuery.of(context).size.width;
  final heig=MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          width: wid,
          height:heig,
          color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 55),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 35),
            child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SecondSc.RouteName);
                    },
                    child: Image.asset("assets/arrow.png"))),
      ),
            Container(
                width: wid,
                height: 400,
               child: Image.asset("assets/taxi-singer-1.png", fit: BoxFit.cover,),
              ),
// Container(
//     width: wid,
//     height: 300,
//     child: Image.asset("assets/Rectangle.png", fit: BoxFit.cover,)),

      Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 15, right: 15),
            child: Container(
  height: 150,
  width: wid,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(15),
    ), color: Color.fromRGBO(52, 52, 52, 1)
  ),
            ),
      ),
      Padding(
            padding: const EdgeInsets.only(top: 14.0, right: 14),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.yellow,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset("assets/startlistening.png"),
                    ))),
            ),



      Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      ), color: Colors.yellow,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      ), color: Colors.white,
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7),
                        ), color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7),
                        ), color: Colors.white,
                      ),
                    ),
                  ),
                  ],),
            ),


    ],
      ),
          ),
        ),
        ),
          );
  }
}
