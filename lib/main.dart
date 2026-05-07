import 'dart:async';
import 'package:jokes_app/JokeApp/databaseHelper/db_helper.dart';
import 'package:flutter/material.dart';
import 'JokeApp/Screens/screen1.dart';
import 'JokeApp/Screens/screen2_homepage.dart';
import 'JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/Screens/viewall_categories.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBCheck.instance.initDB();
  runApp(MyApp());
  // await DBCheck.instance.insertAllJokes();
  //await DBCheck.instance.insertConversation();
}





StreamController<bool> themeCtrl = StreamController.broadcast();

class MyApp  extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: themeCtrl.stream,
      builder: (context, Snapshot) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: JokeApp(),
          ),
        );
      }
    );
  }

}











