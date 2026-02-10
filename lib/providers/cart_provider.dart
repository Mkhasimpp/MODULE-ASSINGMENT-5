import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  void add(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  int get totalItems =>
      _items.values.fold(0, (a, b) => a + b);

  double get totalAmount =>
      _items.entries.fold(
          0, (sum, e) => sum + e.key.price * e.value);

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
