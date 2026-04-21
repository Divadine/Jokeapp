import 'dart:async';

import 'package:flutter/material.dart';
import 'JokeApp/Screens/screen1.dart';
import 'JokeApp/Screens/screen2_homepage.dart';
import 'JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/Screens/viewall_categories.dart';
void main(){

  // print(allCategories);
  // print(riddlesList);
  // print(philosophyList);
  // print(oneLIneJokeList1);

  runApp(MyApp());
}

StreamController<bool> themeCtrl = StreamController.broadcast();

class MyApp  extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: themeCtrl.stream,
      builder: (context, Snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: JokeApp(),
        );
      }
    );
  }

}

// class BackgroundColors {
//   Color first = Colors.black38;
//   Color second = Colors.blueAccent;
//   Color third = Colors.red;
//
// }
//
// Color primaryColor = Colors.red;
//
// List<Color> colorsApp = [
//   Colors.red,Colors.black38,Colors.white
// ];









