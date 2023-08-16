import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:openai_ada/main.dart';
import 'package:provider/provider.dart';

import '../../model/font_model.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  final CarouselController _controller = CarouselController();
  List<String> textss = [
    'Anger Managment',
    'Financials',
    'Fitness',
    'Happiness',
    'Heart Break',
  ];
  List colors = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];
  List<String> svgAssetPaths = [
    'assets/Anger.svg',
    'assets/Financial.svg',
    'assets/Fitness.svg',
    'assets/Happiness.svg',
    'assets/Heart Break.svg',
  ];
  @override
  Widget build(BuildContext context) {
    final caresolIndexVal = Provider.of<FontSizeModel>(context);
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: svgAssetPaths.length,
          //carouselController: _controller,
          options: CarouselOptions(
            height:
                mq.height * 0.22, // Adjust this height as per your requirement
            aspectRatio: 16 / 9, // Adjust this aspect ratio as needed
            viewportFraction: 1,
            enableInfiniteScroll: true,
            initialPage: caresolIndexVal.caresolSliderValue,
            //autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              caresolIndexVal.setCaresolSliderValue(index);
            },
          ),

          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: double.infinity,
            color: colors[itemIndex],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textss[itemIndex],
                    style: TextStyle(fontSize: caresolIndexVal.fontSize)),
                const SizedBox(height: 10),
                SvgPicture.asset(svgAssetPaths[itemIndex]),
                /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: Text('→'),
                    ),
                  ),
                  
                ],
              ),*/
              ],
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: svgAssetPaths.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: mq.height * 0.015,
                margin:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            caresolIndexVal.caresolSliderValue == entry.key
                                ? 0.9
                                : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
