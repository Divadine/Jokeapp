
import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/screen2_homepage.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';


Widget buildSlide({required String bgImage,
  required BuildContext context,
  required String mainImage,
  required int index,
  required PageController pageController,
  required int totalSlides,})
{
  return Container(
    //outside screen decoration
    height:  double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(bgImage),fit: BoxFit.cover),
    ),

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //main Image decoration
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(mainImage),fit: BoxFit.cover),
          ),


        ),


        SizedBox(height: 20,),

        //Content Text here
        Text("Step into a world where every scroll brings you a fresh dose of laughter",
        style: TextStyle(fontSize: 16,color: Colors.white,),
         textAlign: TextAlign.center,
        ),


        SizedBox(height: 20,),

        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
            ),
            onPressed: () async {
              print(index < totalSlides - 1);
              if(index < totalSlides - 1){
                pageController.animateToPage(index + 1, duration: Duration(milliseconds: 400), curve: Curves.easeOut);
              }else{
                // showDialog(context: context, builder: (_) => Center(child: CircularProgressIndicator(),));
                // await Future.delayed(Duration(seconds: 2), () {
                //   Navigator.pop(context);
                // });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen2Homepage(), ));
              }
            },
            child: Text("Next", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
      ],
    ) ,
  );
}



