import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';


class BottomControls extends StatelessWidget {
  final int index;
  final List<JokeContentModel> list;
  final PageController controller;
  final VoidCallback onFavClick;

  const BottomControls({super.key, required this.index,required this.list,required this.controller, required this.onFavClick});

  @override
  Widget build(BuildContext context){
    final item = list[index];

    return Column(
      children: [

        Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child:

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [



                    // BackButton

                    IconButton(
                        onPressed: index > 0 ? () => controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut) : null,
                        icon: const Icon(Icons.arrow_back_ios)
                    ),


                    //count of slides

                    Text("${index + 1} / ${list.length}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),


                    //favourite

                    IconButton(
                        onPressed: onFavClick,
                        icon: Icon(item.isFavourite ? Icons.favorite : Icons.favorite_border, size: 32,),
                    ),


                    //next button

                    IconButton(
                        onPressed: index < list.length -1 ? () => controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut) : null,
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ],
                ),


        ),
      ],
    );

  }
}