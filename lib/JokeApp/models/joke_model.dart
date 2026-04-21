import 'package:flutter/material.dart';

// 1-st Model
class JokeContentModel {
  final int id;
  final String type;
  final String category;
  final String? content;
  final String? question;
  final String? answer;
  final List<Dialogues>? chats;
  final String? image;
  final Color? bgColor;
  bool isFavourite;
  late bool isRead;

  JokeContentModel({
    required this.id,
    required this.type,
    required this.category,
    this.content,
    this.question,
    this.answer,
    this.chats,
    this.image,
    required this.bgColor,
    this.isFavourite = false,
    this.isRead = false,
  });

  @override
  String toString() {
    return 'JokeContentModel( id:$id, type:$type, category:$category,question:$question, answer:$answer, chats:$chats)';
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

  @override
  String toString() {
    return 'Dialogues(speakerName: $speakerName, message: $message, isLeft: $isLeft)';
  }
}


//category types of conversation

//3-rd Model
class JokeCategory{
   final String category;
   final List<JokeContentModel> conversations;

  JokeCategory({required this.category, required this.conversations});

  @override
  String toString(){
    return 'JokeCategory(category : $category, conversations : $conversations)';
  }
}



final husbandWifeCategory = JokeCategory(
    category: "Husband  & Wife ",
    conversations: [
      JokeContentModel(
        id: 1,
        type: "conversation",
        category: "Husband & Wife",
        image: "assets/images/images.jpg",
        bgColor: Colors.lightBlueAccent,
        chats: [
          Dialogues(speakerName: "Husband", message: " Hey", isLeft: false),
          Dialogues(speakerName: "Wife", message: " hello", isLeft: true),
          Dialogues(speakerName: "Husband", message: " Saptiya", isLeft: false),
          Dialogues(speakerName: "Wife", message: " Sapten", isLeft: true),
        ],
      ),

      JokeContentModel(
        id: 2,
        type: "conversation",
        category: "Husband & Wife",
        image: "assets/images/images.jpg",
        bgColor: Colors.lightBlueAccent,
        chats: [
          Dialogues(speakerName: "Husband", message: " Hey", isLeft: false),
          Dialogues(speakerName: "Wife", message: " hello", isLeft: true),
          Dialogues(speakerName: "Husband", message: " Spatiya", isLeft: false),
          Dialogues(speakerName: "Wife", message: " Sapten", isLeft: true),
        ],
      ),
    ],
);


final momDadCategory = JokeCategory(
    category: "mom and dad ",
    conversations: [
      JokeContentModel(
        id: 3,
        type: "conversation",
        category: "mom and dad ",
        image: "assets/images/images.jpg",
        bgColor: Colors.orangeAccent,
        chats: [
          Dialogues(speakerName: "mom", message: " Hey", isLeft: false),
          Dialogues(speakerName: "dad", message: " hello", isLeft: true),
          Dialogues(speakerName: "mom", message: " Spatiya", isLeft: false),
          Dialogues(speakerName: "dad", message: " Sapten", isLeft: true),
        ],
      ),
      JokeContentModel(
        id: 4,
        type: "conversation",
        category: "mom and dad ",
        image: "assets/images/images.jpg",
        bgColor: Colors.orangeAccent,
        chats: [
          Dialogues(speakerName: "mom", message: " Hey", isLeft: false),
          Dialogues(speakerName: "dad", message: " hello", isLeft: true),
          Dialogues(speakerName: "mom", message: " Spatiya", isLeft: false),
          Dialogues(speakerName: "dad", message: " Sapten", isLeft: true),
        ],
      ),
    ]
);

final officeJokes = JokeCategory(
    category: "office jokes",
    conversations: [
      JokeContentModel(id: 101, type: "conversation", category: "office jokes", bgColor: Colors.black38,
      chats: [
        Dialogues(speakerName: "frnd1", message: "hey buddy", isLeft: true),
        Dialogues(speakerName: "frnd2", message: "hey da", isLeft: false),
        Dialogues(speakerName: "frnd1", message: "today leave", isLeft: true),
        Dialogues(speakerName: "frnd2", message: "who", isLeft: false),
        Dialogues(speakerName: "frnd1", message: "Manager", isLeft: true),
        Dialogues(speakerName: "frnd2", message: " OH! NO", isLeft: false),
      ]
      )
    ]);





final broSisCategory = JokeCategory(
    category: "Brother and Sister",
    conversations: [
      JokeContentModel(
        id: 5,
        type: "conversation",
        category: "Brother and Sister",
        image: "assets/images/images.jpg",
        bgColor: Colors.greenAccent,
        chats: [
          Dialogues(speakerName: "Brother", message: " Hey", isLeft: false),
          Dialogues(speakerName: "Sister", message: " hello", isLeft: true),
          Dialogues(speakerName: "Brother", message: " Spatiya", isLeft: false),
          Dialogues(speakerName: "Sister", message: " Sapten", isLeft: true),
        ],
      ),

      JokeContentModel(
        id: 6,
        type: "conversation",
        category: "Brother and Sister",
        image: "assets/images/images.jpg",
        bgColor: Colors.lightBlueAccent,
        chats: [
          Dialogues(speakerName: "Brother", message: " Hey", isLeft: false),
          Dialogues(speakerName: "Sister", message: " hello", isLeft: true),
          Dialogues(speakerName: "Brother", message: " Spatiya", isLeft: false),
          Dialogues(speakerName: "Sister", message: " Sapten", isLeft: true),
        ],
      ),

    ],

);



final allCategories = [husbandWifeCategory,momDadCategory,broSisCategory,officeJokes];


//------------------------------------------------------------------


//---------------------------------------------------------------------
List<JokeContentModel> riddlesList = List.generate(10, (index) {
  return JokeContentModel(
    id: index + 1,
    type: "riddles",
    category: "riddle",
    question: " what is what ",
    answer: " this is",
    image: "assets/images/images.jpg",
    bgColor: Colors.greenAccent,
  );
});

List<JokeContentModel> philosophyList = List.generate(10, (index) {
  return JokeContentModel(
    id: index + 1,
    type: "philosophy",
    category: "joke",
    content: " this is philosophy ",
    image: "no image",
    bgColor: Colors.white,
  );
});

// List<JokeContentModel> conversationList = List.generate(10, (index) {
//   return JokeContentModel(
//     id: index + 1,
//     type: "conversation",
//     category: "Husband & Wife",
//     bgColor: Colors.grey,
//     chats: [
//       Dialogues(speakerName: "husband", message: " hi ", isLeft: true),
//       Dialogues(speakerName: " Wife", message: " enna ", isLeft: false),
//       Dialogues(speakerName: "Husband ", message: " Saptiya ", isLeft: true),
//       Dialogues(speakerName: "Wife", message: " Sapten ", isLeft: false),
//     ],
//   );
// });

List<JokeContentModel> oneLIneJokeList1 = List.generate(10, (index) {
  return JokeContentModel(
    id: index + 1,
    type: "One Line Joke",
    category: "joke",
    content: " this is one line joke  ",
    image: "no image",
    bgColor: Colors.white,
  );
});

List<JokeContentModel> oneLIneJokeList2 = List.generate(10, (index) {
  return JokeContentModel(
    id: index + 1,
    type: "One Line Joke",
    category: "joke",
    content: " this is one line joke  ",
    image: "no image",
    bgColor: Colors.greenAccent,
  );
});

List<JokeContentModel> sliderLists = [
  ...riddlesList.take(1),
  ...oneLIneJokeList1.take(1),
  ...oneLIneJokeList2.take(1),
  ...philosophyList.take(1),
];
