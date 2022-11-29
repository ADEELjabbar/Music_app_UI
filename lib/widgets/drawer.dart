import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_app/screens/favourites_arch.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/profile_sc.dart';
import 'package:music_app/widgets/local_push.dart';
import 'package:music_app/widgets/practice.dart';

class Drawer_Sc extends StatelessWidget {
static const RouteName="/drawer_sc";
  GoogleSignIn gSn=GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;

    return
      Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 5),
        child:
        Container(

          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),

                    ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),

                      child: Image.asset("assets/boy_profile.jpg", fit: BoxFit.fill,)),
                  ),
                ),
                Text("User name", style: TextStyle(color: Colors.white),),
                Divider(color: Colors.grey,),
           Padding(
             padding: const EdgeInsets.only(top: 18.0),
             child: Row(

               children: [
Icon(Icons.person, color: Colors.white,),
               SizedBox(
                 width: 20,
               ),
                 GestureDetector(
                   onTap: (){
                     Navigator.pushNamed(context, Profile_Sc.RouteName);
                   },
                   child: GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, Prac.RouteName);
                     },
                     child: Text("profile", style:TextStyle(color: Colors.white,)


             ),
                   ),
                 )
               ],       // fontSize: 20, fontWeight: FontWeight.bold
                  ),
           ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Favourites_Arch.RouteName);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.white,),
                        SizedBox(
                          width: 20,
                        ),

                        Text("favourites", style:TextStyle(color: Colors.white,))
],),
                  ),
                ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: GestureDetector(
                          onTap: ()async{
                            await gSn.signOut();
                            Navigator.pushReplacementNamed(context, Login_Screen.RouteName);
                          },
                          child: Row(
                  children: [

                    Icon(Icons.logout, color: Colors.white,),
                    SizedBox(
                      width: 20,
                    ),
                    Text("logout",  style:TextStyle(color: Colors.white,
                                // fontSize: 20, fontWeight: FontWeight.bold
                            )),

                  ],
                ),
                        ),
                      ),

              GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, LocalPushNotification.RouteName);
                  },
                  child: Text("Local", style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
