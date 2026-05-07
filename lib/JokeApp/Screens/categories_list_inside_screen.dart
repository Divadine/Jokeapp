import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/widgets/category_inside_sharedwidget_screen.dart';
import 'package:jokes_app/JokeApp/Screens/categoryitem_ui.dart';
import 'package:jokes_app/JokeApp/databaseHelper/db_helper.dart';





class CategoryListScreen extends StatefulWidget{
  final String title;
  final JokeContentModel? model;

  const CategoryListScreen({super.key,this.model, required this.title});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}


class _CategoryListScreenState extends State<CategoryListScreen>{


  List<JokeContentModel> jokes =[];

  bool isLoading = true;

  int index = 0;
  final PageController controller = PageController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // print(widget.model?.toMap());
      if( widget.model != null && widget.model!.category == 'conversations'){
        final db = await DBCheck.instance.database;

        final data = await db.query('conversations');

        jokes = data.map((e) {
          final item = e as Map<String, dynamic>;
          return JokeContentModel(
            id: item['id'],
            type: 'conversations',
            category: item['category'],
            bgColor: Colors.white,
            chats: [],
          );
        }).toList();



        for(int i=0;i<jokes.length;i++){
          //print("Conversation Id => ${jokes[i].id}");
          List<Dialogues> a = await DBCheck.instance.getDialogues(jokes[i].id);
          // for(int j =0 ;j<a.length;j++){
          //   //print('Conversations => ${a[j].toMap()}');
          // }
          jokes[i].chats = a;
        }
        setState(() {

        });

      }
      else{
        loadJokes();
      }

    });
   
    
  }

  void loadJokes() async {
    final data = await DBCheck.instance.getJokes(widget.title);
    jokes = DBCheck.instance.mapJokesToModel(data);
    print(data);
    setState(() {
      isLoading = false;
    });
  }


  Future<void> addingFavList() async {

      jokes[index].isFavourite = !jokes[index].isFavourite;
      print(jokes[index].jokeMap());
      await DBCheck.instance.updateJoke(model: jokes[index]);

      setState(() {});
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(jokes[index].isFavourite ? " Added to Favourites" : " Remove from Favourites",), duration: Duration(milliseconds: 700),)
    );
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: controller,
                  itemCount: jokes.length,
                  onPageChanged: (i) => setState(() => index = i),
                  itemBuilder: (context,i){
                    print("-------------------Jokes------------");
                    print(jokes[i].toMap());
                    return CategoryItemUi(item:jokes[i]);
                  },
              ),
          ),

          //bottomControls

          if(jokes.isNotEmpty)
          BottomControls(
              index: index,
              list: jokes,
              controller: controller,
              onFavClick: addingFavList,
          ),
        ],
      ),
    );
  }
}











