import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartBadge extends StatelessWidget {
  final VoidCallback onPressed;

  const CartBadge({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onPressed,
        ),

        if (cart.totalItems > 0)
          Positioned(
            right: 4,
            top: 4,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                cart.totalItems.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
