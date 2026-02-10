import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product_list.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_badge.dart';
import '../providers/cart_provider.dart';

import 'product_details.dart';
import 'settings_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  int gridCount(double width) {
    if (width < 600) return 2; // Mobile
    return 4; // Tablet/Desktop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        actions: [
          IconButton(
            icon: CartBadge(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCount(MediaQuery.of(context).size.width),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (_, i) {
          return ProductCard(
            products[i],
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetails(products[i]),
                ),
              );
            },
                () {
              Provider.of<CartProvider>(context, listen: false)
                  .add(products[i]);
            },
          );
        },
      ),
    );
  }
}
