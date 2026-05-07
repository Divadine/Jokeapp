import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/categoryitem_ui.dart';
import 'package:jokes_app/JokeApp/databaseHelper/db_helper.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';

class FavouriteScreen extends StatefulWidget {

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState() ;
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<JokeContentModel> favJokes =[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavJokes();
  }

  Future<void> loadFavJokes() async {
    final data = await DBCheck.instance.getFavouritesJokes();
    favJokes = DBCheck.instance.mapJokesToModel(data);

    setState(() {
      isLoading = false;
    });

  }
  
  void openJoke(JokeContentModel item){
    Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(title: Text(item.type),
      ),
      body: CategoryItemUi(item: item),
    )));
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Jokes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue.shade200),),
      ),

      body: isLoading ? Center(child: CircularProgressIndicator(),) : favJokes.isEmpty ? Center(child: Text(" No Favourite Jokes"),) : ListView.builder(
          itemCount: favJokes.length,
          itemBuilder: (context,index) {
            final item = favJokes[index];

            //riddle
            if(item.type == "riddles"){
              return Card(
                child: ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text(item.question ?? "No Question"),
                  subtitle: Text("Answer : ${item.answer ?? "No Answer"}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => openJoke(item),
                ),
              );
            }
            else if(item.type =="philosophy" || item.type == "one line joke"){
              return Card(
                child: ListTile(
                  leading: Icon(Icons.sentiment_satisfied),
                  title: Text(item.content ?? "No Content"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => openJoke(item),
                ),
              );
            }
            else if (item.type == "conversation"){
              return Card(
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: Text(item.category ?? "Conversation"),
                  subtitle: Text("Tap to view full Conversation"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => openJoke(item),
                ),
              );
            }

            return SizedBox();
          })
    );
  }
}