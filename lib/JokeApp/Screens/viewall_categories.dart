import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/categorycardofviewall.dart';
class ViewAllCategoriesScreen extends StatelessWidget {

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(" All Categories"),
      backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing:20 ,
          mainAxisSpacing:12 ,
          childAspectRatio:2 ,


          children: [
            CategoryCardViewAll(title: "Philosophy",imgPath:  "assets/images/slide1_0_img.jpg"),
            CategoryCardViewAll(title: "One Line Jokes", imgPath: "assets/images/slide1_img.jpg"),
            CategoryCardViewAll(title: " Riddles",imgPath:  "assets/images/slide2_img.jpg"),
            CategoryCardViewAll(title: " Conversation ", imgPath: "assets/images/slide3_img.jpg"),
            CategoryCardViewAll(title: "Office Jokes",imgPath: "assets/images/slide3_img.jpg" ),
          ],

        ),


      ),
    );
  }
}




//Grid images and contents
// Widget _buildCategory(String title, String imgPath){
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.grey,
//       borderRadius: BorderRadius.circular(18),
//       image: DecorationImage(image: AssetImage(imgPath),fit: BoxFit.cover,opacity: 0.3),
//
//     ),
//
//     child: Padding(
//       padding: EdgeInsets.all(12),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
//       ),
//
//     ),
//
//   );
// }