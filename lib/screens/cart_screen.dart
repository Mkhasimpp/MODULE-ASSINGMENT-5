import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: cart.items.isEmpty
          ? Center(child: Text("Cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView(
              children: cart.items.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key.name),
                  subtitle: Text("Qty: ${entry.value}"),
                  trailing: Text(
                    "₹${(entry.key.price * entry.value).toStringAsFixed(0)}",
                  ),
                );
              }).toList(),
            ),
          ),

          Divider(),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Items"),
                    Text(cart.totalItems.toString()),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    Text("₹${cart.totalAmount.toStringAsFixed(0)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Place Order"),
                    onPressed: () {
                      cart.clear();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                            content:
                            Text("Order Placed Successfully")),
                      );
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
