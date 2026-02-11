import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;
  double fontSize = 16;

  void toggleTheme(bool v) {
    isDark = v;
    notifyListeners();
  }

  void setFontSize(double v) {
    fontSize = v;
    notifyListeners();
  }
}
