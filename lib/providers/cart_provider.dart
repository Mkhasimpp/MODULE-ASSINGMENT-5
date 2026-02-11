import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void add(Product p) {
    _cart.add(p);
    notifyListeners();
  }

  // For cart badge
  int get totalItems => _cart.length;

  // Total price
  double get total =>
      _cart.fold(0, (sum, item) => sum + item.price);
}
