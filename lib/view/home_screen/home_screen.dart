import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openai_ada/main.dart';
import 'package:provider/provider.dart';

import '../../model/font_model.dart';
import '../widgets/indicdator_caresol.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<String> moods = [
    'MOOD 1',
    'MOOD 2',
    'MOOD 3',
    'MOOD 4',
    'MOOD 5',
  ];
  List colors = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];
  List<String> texts = [
    'Anger Managment',
    'Financials',
    'Fitness',
    'Happiness',
    'Heart Break',
  ];
  List<String> angerMoodeSvg = [
    'assets/Journal1.svg',
    'assets/Chat1.svg',
    'assets/Notification1.svg',
    'assets/Reminder1.svg',
  ];
  //Finance svgs
  List<String> financeSvg = [
    'assets/Journal2.svg',
    'assets/Chat2.svg',
    'assets/Notification2.svg',
    'assets/Reminder2.svg',
  ];
  //Fitness svgs
  List<String> fitnessSvg = [
    'assets/Journal3.svg',
    'assets/Chat3.svg',
    'assets/Notification3.svg',
    'assets/Reminder3.svg',
  ];
  //Happiness svgs
  List<String> happinessSvg = [
    'assets/Journal4.svg',
    'assets/Chat4.svg',
    'assets/Notification4.svg',
    'assets/Reminder4.svg',
  ];
  //Heart Break Svgs
  List<String> heartBreakSvg = [
    'assets/Journal5.svg',
    'assets/Chat5.svg',
    'assets/Notification5.svg',
    'assets/Reminder5.svg',
  ];

  List<String> svgAssetPaths = [
    'assets/Anger.svg',
    'assets/Financial.svg',
    'assets/Fitness.svg',
    'assets/Happiness.svg',
    'assets/Heart Break.svg',
  ];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final List<String> items = [
    'Journal',
    'Chat',
    'Notification',
    'Remider',
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final fontSizeModel = Provider.of<FontSizeModel>(context);
    final caresolIndexVal = Provider.of<FontSizeModel>(context);
    int currentIndex = caresolIndexVal.caresolSliderValue;
    Color containerColor;
    if (currentIndex == 0) {
      containerColor = Colors.red;
    } else if (currentIndex == 1) {
      containerColor = Colors.amber;
    } else if (currentIndex == 2) {
      containerColor = Colors.blue;
    } else if (currentIndex == 3) {
      containerColor = Colors.green;
    } else {
      containerColor = Colors.orange;
    }
    //for diffenr  images in journal,chat,remider,and notificati
    mq = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async {
        exit(0);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 35),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/drawerScreen');
                    },
                    child: Icon(
                      Icons.menu_sharp,
                      color: containerColor,
                      size: 40,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/settingScreen');
                    },
                    child: Icon(
                      Icons.settings,
                      color: containerColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
    
              //define in other file
    
              const CarouselWithIndicatorDemo(),
    
              //for journal chat and other
              SizedBox(
                height: mq.height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.3,
                      mainAxisSpacing: 0.01
                      // Two cards in each row
                      ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToUniqueScreen(context, index);
                      },
                      child: Card(
                        color: containerColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              //if index of moode sldier is zero then we call the ange management svgs
                              if (currentIndex == 0)
                                SvgPicture.asset(
                                  angerMoodeSvg[index],
                                  width: 35,
                                  height: 35,
                                ),
                              //if index of moode sldier is 1 then we call the finance svgs
                              if (currentIndex == 1)
                                SvgPicture.asset(
                                  financeSvg[index],
                                  width: 35,
                                  height: 35,
                                ),
                              //if index of moode sldier is 2 then we call the fitness svgs
                              if (currentIndex == 2)
                                SvgPicture.asset(
                                  fitnessSvg[index],
                                  width: 35,
                                  height: 35,
                                ),
                              //if index of moode sldier is 3 then we call the happiness svgs
                              if (currentIndex == 3)
                                SvgPicture.asset(
                                  happinessSvg[index],
                                  width: 35,
                                  height: 35,
                                ),
                              //if index of moode sldier is 4 then we call the heart break svgs
                              if (currentIndex == 4)
                                SvgPicture.asset(
                                  heartBreakSvg[index],
                                  width: 35,
                                  height: 35,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                items[index],
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.white),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //for ad
              SizedBox(
                height: mq.height * 0.13,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(color: Colors.amber),
                            child: Image.network(
                              i,
                              fit: BoxFit.cover,
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToUniqueScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/journalScreen');
        break;
      case 1:
        Navigator.pushNamed(context, '/chatPage');
        break;
      case 2:
        Navigator.pushNamed(context, '/notificationScreen');
        break;
      case 3:
        Navigator.pushNamed(context, '/reminderScreen');
        break;
    }
  }
}
