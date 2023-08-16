import 'package:flutter/material.dart';

// Light Theme
final lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  hintColor: Colors.blueAccent,
  backgroundColor: Colors.white,
  // Define other light theme properties here
);

// Dark Theme
final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.deepPurple,
  hintColor: Colors.deepPurpleAccent,
  backgroundColor: Colors.black,
  // Define other dark theme properties here
);

// ThemeProvider class using Provider package
class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = (_currentTheme == lightTheme) ? darkTheme : lightTheme;
    notifyListeners();
  }
}
