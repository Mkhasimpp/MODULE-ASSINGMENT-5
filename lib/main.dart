import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class AppProvider extends ChangeNotifier {
  bool dark = false;
  String font = 'Roboto';
  double fontSize = 14;

  Map cart = {};

  void toggleDark() {
    dark = !dark;
    notifyListeners();
  }

  void changeFont(String f) {
    font = f;
    notifyListeners();
  }

  void changeFontSize(double s) {
    fontSize = s;
    notifyListeners();
  }

  void addCart(item) {
    if (cart.containsKey(item['name'])) {
      cart[item['name']]['qty']++;
    } else {
      cart[item['name']] = {...item, 'qty': 1};
    }
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

  double get total {
    double t = 0;
    cart.forEach((k, v) {
      t += v['price'] * v['qty'];
    });
    return t;
  }

  /// CART BADGE = TOTAL QUANTITY
  int get cartCount {
    int count = 0;
    cart.forEach((k, v) {
      count += v['qty'] as int;
    });
    return count;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, p, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          themeMode: p.dark ? ThemeMode.dark : ThemeMode.light,

          darkTheme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: p.fontSize),
            ),
          ),

          theme: ThemeData(
            fontFamily: p.font,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: p.fontSize),
            ),
          ),

          home: const HomeScreen(),
        );
      },
    );
  }
}
