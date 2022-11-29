import 'package:flutter/material.dart';
import 'package:music_app/design_screens/Songs_list.dart';
import 'package:music_app/models/favourites_model.dart';
import 'package:music_app/providers/albums_provider.dart';
import 'package:music_app/providers/auth_provider.dart';
import 'package:music_app/providers/favourites_pro.dart';
import 'package:music_app/providers/playlist_model.dart';
import 'package:music_app/providers/playlist_pro.dart';
import 'package:music_app/providers/popular_bands_provider.dart';
import 'package:music_app/providers/practice_pro.dart';
import 'package:music_app/providers/recently_pro.dart';
import 'package:music_app/providers/trendings_pro.dart';
import 'package:music_app/screens/2nd_screen.dart';
import 'package:music_app/screens/3rd_screen.dart';
import 'package:music_app/screens/4th_screen.dart';
import 'package:music_app/screens/5th_screen.dart';
import 'package:music_app/screens/Cat_g_arc.dart';
import 'package:music_app/screens/Popularbands_Songs.dart';
import 'package:music_app/screens/Trending_arch.dart';
import 'package:music_app/screens/albums_g_arch.dart';
import 'package:music_app/screens/albums_songs.dart';
import 'package:music_app/screens/bands_list_arch.dart';
import 'package:music_app/screens/categories_songs.dart';
import 'package:music_app/screens/favourites_arch.dart';
import 'package:music_app/screens/home_sc.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/main_home.dart';
import 'package:music_app/screens/profile_sc.dart';
import 'package:music_app/screens/recently_arch.dart';
import 'package:music_app/screens/signup_screen.dart';
import 'package:music_app/screens/songplay_screen.dart';
import 'package:music_app/screens/splash_screen.dart';
import 'package:music_app/widgets/drawer.dart';
import 'package:music_app/widgets/first_screen.dart';
import 'package:music_app/widgets/local_push.dart';
import 'package:music_app/widgets/prac2.dart';
import 'package:music_app/widgets/practice.dart';
import 'package:music_app/widgets/practice2.dart';
import 'package:provider/provider.dart';

import 'providers/categories_provider.dart';
import 'screens/playlist_all_songs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

  ChangeNotifierProvider(create: (ctx)=>Categories_Provider()),
  ChangeNotifierProvider(create: (ctx)=>Auth_Provider()),
  ChangeNotifierProvider(create: (ctx)=>Albums_Provider()),
  ChangeNotifierProvider(create: (ctx)=>Popular_Bands_Pro()),
  ChangeNotifierProvider(create: (ctx)=>Trending_pro()),
  ChangeNotifierProvider(create: (ctx)=>PlayList_Pro()),
  ChangeNotifierProvider(create: (ctx)=>Favourites_Pro()),
  ChangeNotifierProvider(create: (ctx)=>Recently_Pro()),
  // ChangeNotifierProvider(create: (ctx)=>PlayList_Model()),
        ChangeNotifierProxyProvider<PlayList_Pro, PlayList_Model>(
          update: (context, auth, previousProducts) => PlayList_Model(songAddress: previousProducts!.songAddress  , songPic: previousProducts!.songPic, SongName: previousProducts.SongName,
              // isFavourite: previousProducts.isFavourite

          ),
          create: (_) => PlayList_Model( SongName: '', songPic: '', songAddress: '',
              // isFavourite: false,
          ),
        ) ,
],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         home:Login_Screen(),
routes:{
          HomeScreen.RouteName:(BuildContext context)=>HomeScreen(),
          FirstSc.RouteName:(BuildContext context)=>FirstSc(),
           SecondSc.RouteName:(BuildContext context)=>SecondSc(),
           ThirdSc.RouteName:(BuildContext context)=>ThirdSc(),
           FourthSc.RouteName:(BuildContext context)=>FourthSc(),
         Cat_G_Arch.RouteName:(BuildContext context)=>Cat_G_Arch(),
      Categories_Songs_Sc.RouteName:(BuildContext context)=>Categories_Songs_Sc(),
      FifthScreen.RouteName:(BuildContext context)=>FifthScreen(),
      Signup_Screen.RouteName:(BuildContext context)=>Signup_Screen(),
      Login_Screen.RouteName:(BuildContext context)=>Login_Screen(),
      Albums_Songs_Sc.RouteName:(BuildContext context)=>Albums_Songs_Sc(),
      Albums_G_Arc.RouteName:(BuildContext context)=>Albums_G_Arc(),
      Popular_B_Songs.RouteName:(BuildContext context)=>Popular_B_Songs(),
      Bands_List_Arch.RouteName:(BuildContext context)=>Bands_List_Arch(),
          Main_Home.RouteName:(BuildContext context)=>Main_Home(),
          Drawer_Sc.RouteName:(BuildContext context)=>Drawer_Sc(),
          Profile_Sc.RouteName:(BuildContext context)=>Profile_Sc(),
          Favourites_Arch.RouteName:(BuildContext context)=>Favourites_Arch(),
  PlayList_All.RouteName:(BuildContext context)=>PlayList_All(),
  Recently_Arch.RouteName:(BuildContext context)=>Recently_Arch(),
  Prac.RouteName:(BuildContext context)=>Prac(),
  LocalPushNotification.RouteName:(BuildContext context)=>LocalPushNotification(),





},
      ),
    );
  }
}
