import 'package:flutter/material.dart';
import 'package:movie_app/Screens/BottomNavBar_Screen.dart';
import 'package:movie_app/Screens/lauch_Screen.dart';
import 'package:movie_app/Screens/movieDetailsScreen.dart';
import 'package:movie_app/Screens/movieList_Screen.dart';
import 'package:movie_app/modals/BnScreen.dart';

import 'Screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute:'/launch_Screen',
        routes: {
        '/launch_Screen': (context)=>    LaunchScreen() ,
         '/home_Screen' : (context) => const HomeScreen(),
         '/main_Screen' : (context) => const MainScreen(),
          '/Bn_Screen' :(context) => const MainScreen()
         // '/detail_Screen' : (context) => const DetailScreen(movie ),


        }
    );
  }
}
