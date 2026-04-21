import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/data/jokesdata.dart';
import 'categories_list_inside_screen.dart';




class CategoryCardViewAll extends StatelessWidget {
  final String title;
  final String imgPath;
  
  const CategoryCardViewAll({super.key, required this.title, required this.imgPath});
  
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => CategoryListScreen(title : title, list:getCategoryList(title),),
            ),
        );
      },
      
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(18),
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover, opacity: 0.3,),
        ),
        child: Padding(
            padding: EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
          ),
        ),
      ),
    );
  }
}