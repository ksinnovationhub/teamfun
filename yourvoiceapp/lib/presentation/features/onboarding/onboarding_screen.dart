import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:thumbprint/presentation/features/onboarding/slideTitle.dart';
import 'package:thumbprint/presentation/features/onboarding/sliderModel.dart';

import 'get_started_screen.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 9.0,
      width: isCurrentPage ? 12.0 : 9.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }

  buildSlides(){
    slides = slides;
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    buildSlides();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(),
          title: GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetStartedScreen()));
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                    color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: const Icon(
            Icons.keyboard_arrow_right,
            size: 35.0,
          ),
          onPressed: (){
            if(slideIndex != 2){
              controller.animateToPage(slideIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
            }
            else{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetStartedScreen()));
            }
          },
          backgroundColor: Colors.green,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView.builder(
            itemCount: slides.length,
            itemBuilder: (context,index){
              return SlideTile(slide: slides[index],);
            },
            controller: controller,
            onPageChanged: (index){
              setState(() {
                slideIndex = index;
              });
            },

          ),
        ),
        bottomSheet: Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //Image placed at the bottom of the screen
                child: Row(
                    children: [
                      for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                    ]
                ),
              ),
            ],
          ),
        )
    );
  }

}