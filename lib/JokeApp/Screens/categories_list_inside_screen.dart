import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/widgets/category_inside_sharedwidget_screen.dart';
import 'package:jokes_app/JokeApp/Screens/categoryitem_ui.dart';

class CategoryListScreen extends StatefulWidget{

  final String title;
  final List<JokeContentModel> list;


  const CategoryListScreen({required this.title, required this.list});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}


class _CategoryListScreenState extends State<CategoryListScreen>{



  int index = 0;
  final PageController controller = PageController();

  void addingFavList() {
    setState(() {
      widget.list[index].isFavourite = !widget.list[index].isFavourite;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(widget.list[index].isFavourite ? " Added to Favourites" : " Remove from Favourites",), duration: Duration(milliseconds: 700),)
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
                  itemCount: widget.list.length,
                  onPageChanged: (i) => setState(() => index = i),


                  itemBuilder: (context,i){
                    return CategoryItemUi(item:widget.list[i]);
                  },
              ),
          ),

          //bottomControls

          BottomControls(
              index: index,
              list: widget.list,
              controller: controller,
              onFavClick: addingFavList,
          ),
        ],
      ),
    );
  }
}











