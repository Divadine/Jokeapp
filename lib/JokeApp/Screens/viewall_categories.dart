import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/categorycardofviewall.dart';

import '../utils/app_utils.dart';





class ViewAllCategoriesScreen extends StatelessWidget {

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(" All Categories"),
      backgroundColor: AppUtils.primary,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing:20 ,
          mainAxisSpacing:12 ,
          childAspectRatio:2 ,


          children: [
            CategoryCardViewAll(title: "philosophy",imgPath:  "assets/images/slide1_0_img.jpg"),
            CategoryCardViewAll(title: "one line joke", imgPath: "assets/images/slide1_img.jpg"),
            CategoryCardViewAll(title: "riddles",imgPath:  "assets/images/slide2_img.jpg"),
            CategoryCardViewAll(title: "conversation", imgPath: "assets/images/slide3_img.jpg"),

          ],

        ),


      ),
    );
  }
}



