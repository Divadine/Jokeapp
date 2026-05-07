import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/Screens/screen2_homepage.dart';
import 'package:jokes_app/JokeApp/widgets/homepage_slide_sharedwidget.dart';
import 'package:jokes_app/JokeApp/databaseHelper/db_helper.dart';
class JokeApp extends StatefulWidget {
  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {



  int currentIndex = 0;
  PageController pageController = PageController();

  final List<Map<String, String>> slides = [
    {"bg": "assets/images/bg1_img.jpg", "img": "assets/images/slide1_0_img.jpg"},
    {"bg": "assets/images/bg2_img.jpg", "img": "assets/images/slide1_img.jpg"},
    {"bg": "assets/images/bg3_img.jpg", "img": "assets/images/slide2_img.jpg"},
    {"bg": "assets/images/bg4_img.jpg", "img": "assets/images/slide3_img.jpg"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBCheck.instance.initDB();
    DBCheck.instance.insertAllJokes();
    DBCheck.instance.insertConversation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return buildSlide(
                bgImage: slides[index]["bg"]!,
                mainImage: slides[index]["img"]!,
                context: context,
                index: index,
                pageController: pageController,
                totalSlides: slides.length,
              );
            },
          ),

          // Skip Button
          Positioned(
            top: 30,
            right: 20,
            child: GestureDetector(

              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2Homepage(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),

          // Dots Navigation
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slides.length, (index) {
                return Container(
                  height: 8,
                  width: currentIndex == index ? 18 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}


