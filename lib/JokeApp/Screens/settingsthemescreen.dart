import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/screen2_homepage.dart';
import 'package:jokes_app/JokeApp/utils/app_utils.dart';
import 'package:jokes_app/main.dart';





class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});



  @override
  State<ThemeScreen> createState() => _ThemeScreenState();


}


class _ThemeScreenState extends State<ThemeScreen>{



  final List<Color> colorList = [Colors.red,Colors.blue,Colors.green,Colors.yellow,Colors.purple,Colors.orange,Colors.pink,Colors.purple,Colors.brown,Colors.grey,Colors.indigo,Colors.black,Colors.lime,];
  // Color selectedColor = Colors.blue;


  // Widget buildColorCircle(Color color){
  //   return GestureDetector(
  //     onTap: (){
  //       setState((){
  //         selectedColor = color;
  //       });
  //     },
  //     child: CircleAvatar(backgroundColor: color,radius: 25,),
  //   );
  //
  // }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Themes "),
        backgroundColor: AppUtils.primary,
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("choose theme color", style: TextStyle(fontSize: 18,color: AppUtils.selectedColor),),

            SizedBox(height: 20,),

           Expanded(
               child: GridView.builder(
                   padding: EdgeInsets.all(20),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 2),
                   itemCount: colorList.length,
                   itemBuilder: (context, index){
                     final color = colorList[index];

                     return GestureDetector(
                       onTap: (){
                         setState(() {
                           AppUtils.selectedColor = color;
                         });
                         themeCtrl.sink.add(true);
                       },
                       child: Container(
                         //height: 10,
                         //width: 10,
                         decoration: BoxDecoration(
                           color: color,
                           shape: BoxShape.circle,

                           border: AppUtils.selectedColor == color ? Border.all(color: Colors.black, width: 3) : null ,

                         ),
                         child: CircleAvatar(backgroundColor: color,radius: 2,),

                       ),
                     );
                   })),


            SizedBox(height: 30,),


          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 50,
        color: AppUtils.selectedColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){print("home button clicked");}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){print("search button clicked");}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){print("favourite button clicked");}, icon: Icon(Icons.favorite)),
          ],
        ),
      ),
    );
  }
}


