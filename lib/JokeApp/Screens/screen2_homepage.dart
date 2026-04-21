import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/categories_list_inside_screen.dart';
import 'package:jokes_app/JokeApp/Screens/conversation_categories.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:jokes_app/JokeApp/Screens/viewall_categories.dart';
import 'package:jokes_app/JokeApp/Screens/conversation_categories.dart';
import 'package:jokes_app/JokeApp/utils/app_utils.dart';
import 'package:jokes_app/JokeApp/widgets/joke_card_slider.dart';
import 'package:jokes_app/JokeApp/widgets/homepage_slide_sharedwidget.dart';
import 'package:jokes_app/JokeApp/widgets/joke_card_slider.dart';
import 'package:jokes_app/JokeApp/Screens/settingsthemescreen.dart';
import 'package:jokes_app/JokeApp/Screens/settingscreen.dart';




class Screen2Homepage extends StatefulWidget {

  @override
  State<Screen2Homepage> createState() => _Screen2HomePageState();
}


class _Screen2HomePageState extends State<Screen2Homepage>{

  int currentIndex = 0;
  PageController pageController = PageController();



  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: AppUtils.primary,
        //backgroundColor:ThemeScreen.get(selectedColor),
        title: Text(" Jokes ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 18),
              child: IconButton(
                  onPressed: (){
                    print("Setting button clicked");
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SettingScreen()));

                  },
                  icon: Icon(Icons.settings,color: Colors.white,size: 28,)),

          ),

        ],

      ),
      
      

      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(12),
              child: Text("Joke of the day",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),





            ),

            //page slider


            Container(
                height: 160,
                child: PageView.builder(
                  itemCount: 4,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
              
                  itemBuilder: (context,index){
                    final item =sliderLists[index];

                    return GestureDetector(
                      onTap: (){
                        final  item = sliderLists[currentIndex];

                        if(item.type == "philosophy"){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "philosophy", list: philosophyList)));
                        }
                        else if(item.type == "One Line Joke") {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "one line joke", list: oneLIneJokeList1 + oneLIneJokeList2)));
                        }
                        else if (item.type == "riddles"){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "riddles", list: riddlesList)));
                        }

                        else if (item.type == "conversation"){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ConversationCategoryScreen(allJokes: allCategories.expand((a) => a.conversations).toList())));
                        }
                      },
                      child : JokeCard(title : item.category, joke :item.content ?? item.question ?? " No data available")
                    );
                  },
              
                ),
              
              ),


            SizedBox(height: 10,),

            //dots - using container for slider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index){
                return Container(
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 30 : 10,

                  decoration: BoxDecoration(
                    color: currentIndex == index ? AppUtils.primary : AppUtils.primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),

            SizedBox(height:10,),

            // category tile and view all button

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //Text("View All ", style: TextStyle(color: Colors.blueGrey),)
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllCategoriesScreen()),);

                    },
                    child: Text(" View All", style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),


            ),

            SizedBox(height: 10,),

            //grids of category

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2,

                children: [
                  _buildCategory("philosophy", "assets/images/slide1_0_img.jpg",),
                  _buildCategory("one line jokes", "assets/images/slide1_img.jpg",),
                  _buildCategory("riddles", "assets/images/slide2_img.jpg",),
                  _buildCategory("conversation", "assets/images/slide2_img.jpg",),

                ],

              ),



            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
      
      
      
      
      bottomNavigationBar: Container(
        height: 50,
        color: AppUtils.primary,
        //padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        // decoration: BoxDecoration(
        //   color: Colors.blue,
        //   // borderRadius: BorderRadius.only(
        //   //   topLeft: Radius.circular(20),
        //   //   topRight: Radius.circular(20),
        //   // )
        // ),
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


  //Grid images and contents
  Widget _buildCategory(String title, String imgPath){
    return GestureDetector(
      onTap: (){
        if(title == "philosophy"){
          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "philosophy", list: philosophyList),),);
        }
        else if(title == "one line jokes"){
          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "one line Jokes", list: oneLIneJokeList1 + oneLIneJokeList2)));
        }
        else if(title == "riddles"){
          Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryListScreen(title: "riddles", list: riddlesList)));
        }

        else if(title == "conversation"){
          Navigator.push(context, MaterialPageRoute(builder: (_) => ConversationCategoryScreen(allJokes: allCategories.expand((a) => a.conversations).toList()),));
        }
      },
      child: Container(

        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(image: AssetImage(imgPath),fit: BoxFit.cover,opacity: 0.3),



        ),

        child: Padding(
          padding: EdgeInsets.all(12),
          child: Align(

            alignment: Alignment.topCenter,
            child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

          ),

        ),

      ),
    );
  }
}





