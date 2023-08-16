import 'package:flutter/material.dart';

class FontSizeModel extends ChangeNotifier {
  double _fontSize = 18.0;
  //caresol value of index
  int _caresolSliderValue = 0;

  double get fontSize => _fontSize;
  //getiing calue of caresol index
  int get caresolSliderValue => _caresolSliderValue;
  //to set the font of a whole app
  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }
  //when value is changes of a caresol index of homescreen

  void setCaresolSliderValue(int val){
    _caresolSliderValue = val;
    notifyListeners();
  }
}
