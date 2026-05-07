import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 1-st Model
class JokeContentModel {
  final int id;
  final String type;
  final String? category;
  final String? content;
  final String? question;
  final String? answer;
  List<Dialogues> chats;
  final String? image;
  final Color? bgColor;
  bool isFavourite;
  late bool isRead;

  JokeContentModel({
    required this.id,
    required this.type,
    this.category,
    this.content,
    this.question,
    this.answer,
    this.image,
    required this.bgColor,
    this.isFavourite = false,
    this.isRead = false,
    List<Dialogues>? chats,
  }) : chats = chats ?? [];

  factory JokeContentModel.fromJson(Map<String, dynamic> e) {
    return JokeContentModel(
        id: e['id'],
        type: e['type'],
        category: e['category'],
        content: e['content'],
        question: e['question'],

        answer: e['answer'],
        bgColor: Colors.white,
        image: e['image'],
        isFavourite : e['is_favourite'] == 1 ? true : false,
      isRead: e['is_readed'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> jokeMap() {
    return {
      'id': id,
      'type': type,
      'category': category,
      'content': content,
      'image': image,
      'is_favourite': isFavourite ? 1 : 0,
      'is_readed': isRead ? 1 : 0,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'category': category,
      'content': content,
      'chats': chats.map((e) => e.toMap()).toList(),
      // 'bgColor': Colors.white,
      'image': image,
      'is_favourite': isFavourite ? 1 : 0,
      'is_readed': isRead ? 1 : 0,
    };
  }


}

//2-nd Model
class Dialogues {
  final String speakerName;
  final String message;
  final bool isLeft;

  Dialogues({
    required this.speakerName,
    required this.message,
    required this.isLeft,
  });


 factory Dialogues.fromJson(Map<String, dynamic> json) {
   return Dialogues(speakerName: json["speaker"], message: json["message"], isLeft: json["is_left"] == 1 ? true : false);
 }

 Map<String,dynamic> toMap(){
   return {
     'speakerName':speakerName,
     'message' :message,
     'isLeft' :isLeft,
   };
 }

}

//category types of conversation

//3-rd Model
class JokeCategory {
  final String category;
  final List<JokeContentModel> conversations;

  JokeCategory({required this.category, required this.conversations});

  factory JokeCategory.fromJson(Map<String,dynamic> a) {
    return JokeCategory(category:a['category'] , conversations: a['conversations']);
  }

  Map<String,dynamic> toMap() {
    return {
      'category' :category,
      'conversations':conversations,
    };
  }

}
