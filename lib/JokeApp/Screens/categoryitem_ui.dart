import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/models/profilemodel.dart';



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

    if(item.type == "riddles"){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),

              child: Column(
                children: [
                  Icon(Icons.help_outline,size: 50,color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(item.question ?? "", textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
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
                          content: Text(isRead ? " Mark as UnRead" : " Mark as Read",),
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
                         isRead = !isRead;
                         print(isRead);
                       });
                     }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isRead ? Colors.blue : Colors.transparent,
                      border: Border.all(color: Colors.blue),
                    ),

                    child: Text(isRead ? "UnRead" : "Mark as Read", style: TextStyle(color: isRead ? Colors.white : Colors.blue, fontWeight: FontWeight.bold),),
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
    if(item.type == "philosophy") {

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
                      borderRadius: BorderRadius.circular(10),color: Colors.blue.shade200,
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
                  color: isRead ? Colors.blue : Colors.transparent,
                  border: Border.all(color: Colors.black),
                ),
                child: GestureDetector(
                  onTap: () async{
                    final confirm = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Confirm"),
                          content: Text(isRead ? "Do you want to mark as unread?" : " Do you want to mark as read?",),
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
                        isRead = !isRead;
                      });
                    }

                  },
                  child: Center(
                    child: Text(isRead ? "UnRead" : "Mark as Read",style: TextStyle(fontWeight: FontWeight.bold,color: isRead ? Colors.white : Colors.blue),),
                  ),
                ),
              ),

            ],
          ),


      );
    }

    //conversation

    if(item.type == "conversation"){

      return ListView(
        padding: EdgeInsets.all(20),
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
      );


    }

    //One Line Joke

    if(item.type == "One Line Joke"){
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
                  borderRadius: BorderRadius.circular(10),color: Colors.blue.shade200,
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
                color: isRead ? Colors.blue : Colors.transparent,
                border: Border.all(color: Colors.black),
              ),
              child: GestureDetector(
                onTap: () async{
                  final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Confirm"),
                        content: Text(isRead ? "Do you want to mark as unread?" : " Do you want to mark as read?",),
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
                      isRead = !isRead;
                    });
                  }

                },
                child: Center(
                  child: Text(isRead ? "UnRead" : "Mark as Read",style: TextStyle(fontWeight: FontWeight.bold,color: isRead ? Colors.white : Colors.blue),),
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