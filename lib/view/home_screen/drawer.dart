import 'package:flutter/material.dart';
import 'package:openai_ada/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../model/font_model.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final fontSizeModel = Provider.of<FontSizeModel>(context);
    final currentIndexx = Provider.of<FontSizeModel>(context);
    int currentIndex = fontSizeModel.caresolSliderValue;
    //for color from index of moode
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: containerColor,
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/cross.png',
                          height: 22,
                          color: Colors.black,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Select Mood',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //anger management
                      GestureDetector(
                        onTap: () {
                          currentIndexx.setCaresolSliderValue(0);
                          Navigator.pushNamed(context, '/myHomeScreen');
                        },
                        child: Container(
                          color: containerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Anger Managment',
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.black),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Financials
                      GestureDetector(
                        onTap: () {
                          currentIndexx.setCaresolSliderValue(1);
                          Navigator.pushNamed(context, '/myHomeScreen');
                        },
                        child: Container(
                          color: containerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Financials',
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.black),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Fitness
                      GestureDetector(
                        onTap: () {
                          currentIndexx.setCaresolSliderValue(2);
                          Navigator.pushNamed(context, '/myHomeScreen');
                        },
                        child: Container(
                          color: containerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fitness',
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.black),
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.black, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Happiness
                      GestureDetector(
                        onTap: () {
                          currentIndexx.setCaresolSliderValue(3);
                          Navigator.pushNamed(context, '/myHomeScreen');
                        },
                        child: Container(
                          color: containerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Happiness',
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.black),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Heart Break
                      GestureDetector(
                        onTap: () {
                          currentIndexx.setCaresolSliderValue(4);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          color: containerColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Heart Break',
                                style: TextStyle(
                                    fontSize: fontSizeModel.fontSize,
                                    color: Colors.black),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
