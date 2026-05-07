import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/data/jokesdata.dart';
import 'package:jokes_app/JokeApp/databaseHelper/db_helper.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/Screens/categories_list_inside_screen.dart';



class ConversationCategoryScreen extends StatefulWidget{

  ConversationCategoryScreen({super.key});

  @override
  State<ConversationCategoryScreen> createState() => _ConversationCategoryScreenState();
}

class _ConversationCategoryScreenState extends State<ConversationCategoryScreen> {
  List<JokeContentModel> categories = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    final db = await DBCheck.instance.database;

    final data = await db.query('conversations');

    categories = data.map((e) {
      final item = e as Map<String, dynamic>;
      return JokeContentModel(
        id: item['id'],
        type: item['category'],
        bgColor: Colors.white,
      );
    }).toList();

    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context){

    //final categories = allJokes.where((e) => e.type == "conversation").map((e) => e.category).toSet().toList();

    print(categories.length);
    return Scaffold(
      appBar: AppBar(title: Text("Conversation Categories"),),


      body:isLoading ? const Center(child: CircularProgressIndicator(),) : categories.isEmpty ? const Center(child: Text(" No Data Found"),) : GridView.builder(

        padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: categories.length,
          itemBuilder: (context,index){
            final category = categories[index];

            return GestureDetector(
              onTap: (){


                Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title : "conversations", model: JokeContentModel(id: category.id, type: category.type, bgColor: Colors.white, category: 'conversations'),)));

              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(category.type, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
              ),
            );
          }
      ),
    );
  }
}