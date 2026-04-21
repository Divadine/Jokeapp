

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/utils/app_utils.dart';

class JokeCard extends StatelessWidget{
  final String title;
  final String joke;

  const JokeCard({super.key,required this.title, required this.joke});


  @override
  Widget build (BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: AppUtils.primary.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppUtils.primary, width: 2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          const SizedBox(height: 5,),

          Divider(thickness: 1, color: AppUtils.primary,),
          
          const SizedBox(height: 5,),
          
          Expanded(child: Center(
            child: Text(joke,textAlign: TextAlign.center, style: const TextStyle(fontSize: 16),),
          ))
        ],
      ),
    );
  }
}