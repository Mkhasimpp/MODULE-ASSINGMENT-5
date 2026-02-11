import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map product;
  final VoidCallback onAdd;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product['img'], height: 80),
            Text(product['name']),
            Text("₹${product['price']}"),
            ElevatedButton(onPressed: onAdd, child: const Text("Add Cart")),
          ],
        ),
      ),
    );
  }
}
