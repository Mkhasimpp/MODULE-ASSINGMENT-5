import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  double baseFontSize = 14; // 12 / 14 / 18
  bool useRoboto = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  void setSmall() {
    baseFontSize = 12;
    notifyListeners();
  }

  void setMedium() {
    baseFontSize = 14;
    notifyListeners();
  }

  void setLarge() {
    baseFontSize = 18;
    notifyListeners();
  }

  void toggleFont() {
    useRoboto = !useRoboto;
    notifyListeners();
  }
}
