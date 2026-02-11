import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'settings_screen.dart';
import 'cart_screen.dart';
import 'product_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var p = context.watch<AppProvider>();

    final products = [
      {'name': 'Laptop', 'price': 45000.0, 'img': 'assets/images/laptop.png'},
      {'name': 'Phone', 'price': 15000.0, 'img': 'assets/images/phone.png'},
      {'name': 'Headset', 'price': 2000.0, 'img': 'assets/images/headset.png'},
      {'name': 'Watch', 'price': 3000.0, 'img': 'assets/images/watch.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        actions: [

          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
              ),

              if (p.cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      p.cartCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                )
            ],
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .75,
        ),
        itemCount: products.length,

        itemBuilder: (_, i) {
          var item = products[i];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductDetails(item)),
              );
            },

            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(item['img'] as String, height: 80),

                  const SizedBox(height: 10),

                  Text(item['name'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold)),

                  Text("₹${item['price']}"),

                  const SizedBox(height: 5),

                  ElevatedButton(
                    onPressed: () => p.addCart(item),
                    child: const Text("Add Cart"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
