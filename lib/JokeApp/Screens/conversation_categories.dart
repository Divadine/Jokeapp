import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/Screens/categories_list_inside_screen.dart';



class ConversationCategoryScreen extends StatelessWidget{

  final List<JokeContentModel> allJokes;


  const ConversationCategoryScreen({required this.allJokes});

  @override
  Widget build(BuildContext context){
    final categories = allJokes.where((e) => e.type == "conversation").map((e) => e.category).toSet().toList();
    return Scaffold(
      appBar: AppBar(title: Text("Conversation Categories"),),


      body: GridView.builder(

        padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: categories.length,
          itemBuilder: (context,index){
            String a = categories[index];

            return GestureDetector(
              onTap: (){

                print(categories);
                print("------------------------------------");
                print(allJokes.where((e) => e.type == "conversation").map((e) => e.category));
                print(" ----------------------------------------------------------------------------------");
                print(allJokes.where((e) => e.type == "conversation").map((e) => e.category).toSet());
                print(("-------------------------------------------------------"));
                print(allJokes.where((e) => e.type == "conversation").map((e) => e.category).toSet().toList());

                print("-----------------------------");
                print(allJokes.where((e) => e.category == a).toList());
                print(a);
                print("---------------------------------------------------------------------------");
                List<JokeContentModel> filtered = allJokes.where((e) => e.category == a).toList();
                Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: a, list: filtered,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(a, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
              ),
            );
            
          }
      ),
    );
  }
}