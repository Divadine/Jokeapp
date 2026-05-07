import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/models/profilemodel.dart';

import '../databaseHelper/db_helper.dart';
import '../utils/app_utils.dart';



List<ProfileModel> images =[
  ProfileModel(image1:"assets/images/boy.jpg" , char:"husband"),
  ProfileModel(image1: "assets/images/girl.jpg", char: "wife"),
  ProfileModel(image1:"assets/images/doctor.jpg",char: "doctor" ),
  ProfileModel(image1: "assets/images/patient.jpg",char:"patient" ),
  ProfileModel(image1: "assets/images/brother.jpg",char:"brother" ),
  ProfileModel(image1: "assets/images/sister.jpg",char:"sister" ),
  ProfileModel(image1: "assets/images/mom.jpg",char:"mom" ),
  ProfileModel(image1: "assets/images/dad.jpg",char:"dad" ),
];

String getImage(String name){
  try{
    return images.firstWhere((e) => e.char.toLowerCase() == name.toLowerCase()).image1;
  } catch(e){
    return "";
  }
}



class CategoryItemUi extends StatefulWidget {
  final JokeContentModel item;

  const CategoryItemUi({super.key, required this.item});

  @override
  State<CategoryItemUi> createState() => _CategoryItemUiState();
}

class _CategoryItemUiState extends State<CategoryItemUi>{

  bool isRead = false;

  @override
  Widget build(BuildContext context){

    final item = widget.item;

    if(item.type.trim().toLowerCase() == "riddles"){

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: AppUtils.primary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),

              child: Column(
                children: [
                  Icon(Icons.help_outline,size: 50,color: AppUtils.primary,),
                  SizedBox(height: 10,),

                  Text(item.question ?? item.content ?? "No data", textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(

                  onTap: () async {
                     final confirm = await showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Confirm"),
                          content: Text(item.isRead ? " Mark as UnRead" : " Mark as Read",),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context,false),
                                child: Text(" No"),
                            ),

                            TextButton(
                                onPressed:() =>  Navigator.pop(context,true),
                                child: Text(" Yes")
                            ),
                          ],
                        ),
                    );
                     if(confirm == true){
                       setState(() {
                         item.isRead = !item.isRead;
                         print(isRead);
                       });
                     }
                     await DBCheck.instance.updateJoke(model: item);
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: item.isRead ? Colors.blue : Colors.transparent,
                      border: Border.all(color: Colors.blue),
                    ),

                    child: Text(item.isRead ? "UnRead" : "Mark as Read", style: TextStyle(color: item.isRead ? Colors.white : Colors.black, fontWeight: FontWeight.bold),),
                  ),
                ),



                GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
                          title: Text("Answer"),
                          content: Text(item.answer ?? "", style: TextStyle(fontSize: 16),),
                          actions: [
                            TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Close")),
                          ],
                          
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Show Answer", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
            // Text(" Q : ${item.question}"),
            // SizedBox(height: 30,),
            // Text("A : ${item.answer}"),
          ],
        ),
      );
    }
    //philosophy
    if(item.type.trim().toLowerCase() == "philosophy") {

      return Center(

        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(

                padding: EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: AppUtils.primary,
                  ),
                  child: Center(
                    child: Text(item.content ?? "", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),

                  ),
                ),
                //child: Text(item.content ?? "", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),

              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item.isRead ? Colors.blue : Colors.transparent,
                  border: Border.all(color: Colors.black),
                ),
                child: GestureDetector(
                  onTap: () async{
                    final confirm = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Confirm"),
                          content: Text(item.isRead ? "Do you want to mark as unread?" : " Do you want to mark as read?",),
                          actions: [
                            TextButton(
                                onPressed:() => Navigator.pop(context,false) ,
                                child: Text("No")
                            ),

                            TextButton(
                                onPressed: () => Navigator.pop(context,true),
                                child: Text("Yes")
                            ),


                          ],
                        )
                    );

                    if(confirm == true){
                      setState(() {
                        item.isRead = !item.isRead;
                      });
                    }
                    await DBCheck.instance.updateJoke(model: item);

                  },
                  child: Center(
                    child: Text(item.isRead ? "UnRead" : "Mark as Read",style: TextStyle(fontWeight: FontWeight.bold,color: isRead ? Colors.white : Colors.black),),
                  ),
                ),
              ),

            ],
          ),


      );
    }

    //conversation

    if(item.type == "conversations"){
      print("Item => ${item.toMap()}");
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              width: 500,
              child: ListView(
                padding: EdgeInsets.all(10),
                children: item.chats!.map((chat) {

                  // Left Message
                  if (chat.isLeft) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(getImage(chat.speakerName)),
                        ),
                        SizedBox(width: 10),

                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          color: Colors.blue,
                          child: Text(chat.message),
                        ),
                      ],
                    );
                  }

                  // Right Message
                  else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          color: Colors.green,
                          child: Text(chat.message),
                        ),
                        SizedBox(width: 10),

                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(getImage(chat.speakerName)),
                        ),
                      ],
                    );
                  }

                }).toList(),
              ),
            ),
          ),

          //SizedBox(height: 10,),

          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: item.isRead ? Colors.blue : Colors.transparent,
              border: Border.all(color: Colors.black),
            ),
            child: GestureDetector(
              onTap: () async{
                final confirm = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Confirm"),
                      content: Text(item.isRead ? "Do you want to mark as unread?" : " Do you want to mark as read?",),
                      actions: [
                        TextButton(
                            onPressed:() => Navigator.pop(context,false) ,
                            child: Text("No")
                        ),

                        TextButton(
                            onPressed: () => Navigator.pop(context,true),
                            child: Text("Yes")
                        ),


                      ],
                    )
                );

                if(confirm == true){
                  setState(() {
                    item.isRead = !item.isRead;
                  });
                }
                await DBCheck.instance.updateJoke(model: item);

              },
              child: Center(
                child: Text(item.isRead ? "UnRead" : "Mark as Read",style: TextStyle(fontWeight: FontWeight.bold,color: isRead ? Colors.white : Colors.black),),
              ),
            ),
          ),
        ],

      );




    }

    //One Line Joke

    if(item.type == "one line joke"){
      return Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(

              padding: EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: AppUtils.primary,
                ),
                child: Center(
                  child: Text(item.content ?? "", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),

                ),
              ),
              //child: Text(item.content ?? "", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20,),

            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: item.isRead ? Colors.blue : Colors.transparent,
                border: Border.all(color: Colors.black),
              ),
              child: GestureDetector(
                onTap: () async{
                  final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Confirm"),
                        content: Text(item.isRead ? "Do you want to mark as unread?" : " Do you want to mark as read?",),
                        actions: [
                          TextButton(
                              onPressed:() => Navigator.pop(context,false) ,
                              child: Text("No")
                          ),

                          TextButton(
                              onPressed: () => Navigator.pop(context,true),
                              child: Text("Yes")
                          ),


                        ],
                      )
                  );

                  if(confirm == true){
                    setState(() {
                      item.isRead = !item.isRead;
                    });
                  }
                  await DBCheck.instance.updateJoke(model: item);
                },
                child: Center(
                  child: Text(item.isRead ? "UnRead" : "Mark as Read",style: TextStyle(fontWeight: FontWeight.bold,color: isRead ? Colors.white : Colors.black),),
                ),
              ),
            ),

          ],
        ),


      );
    }

    return Text(" Unknown Category");
  }
}



