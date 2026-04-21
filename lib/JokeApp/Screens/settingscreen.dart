import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/settingsthemescreen.dart';
import 'package:jokes_app/JokeApp/utils/app_utils.dart';

class SettingScreen extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: AppUtils.primary,


      appBar: AppBar(
        backgroundColor: AppUtils.selectedColor,
        title: Text("Settings",style: TextStyle(color: Colors.white)),),

      body:Padding(

        padding: const EdgeInsets.all(8.0),
        child: ListView(

          children: [
            ListTile(
              title: Text("Themes", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ThemeScreen()));
              },
            ),
            Divider(),

            ListTile(title:Text("instructions",style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.arrow_forward_ios),),

            Divider(),

            ListTile(title:  Text("instructions",style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios),),

            Divider(),

            ListTile(title: Text("instructions",style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios),),


          ],
        ),
      ) ,
    );

  }
}