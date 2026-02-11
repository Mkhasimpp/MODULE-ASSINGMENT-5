import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Map product;

  const ProductDetails(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InteractiveViewer(
              child: Image.asset(product['img'], height: 250),
            ),

            const SizedBox(height: 20),

            Text(
              product['name'],
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text(
              "₹${product['price']}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
