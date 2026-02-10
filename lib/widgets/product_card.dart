import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAdd;

  const ProductCard(this.product, this.onTap, this.onAdd, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Product Image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image, size: 60),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // Product Name
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),

              // Price
              Text("₹${product.price.toStringAsFixed(0)}"),

              const SizedBox(height: 4),

              // Rating Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                      (index) =>
                  const Icon(Icons.star, size: 14, color: Colors.orange),
                ),
              ),

              const SizedBox(height: 6),

              // Add Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAdd,
                  child: const Text("Add Cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
