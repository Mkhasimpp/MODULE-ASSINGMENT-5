import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var p = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [

          Expanded(
            child: p.cart.isEmpty
                ? const Center(child: Text("Cart is Empty"))
                : ListView(
              children: p.cart.values.map<Widget>((e) {
                return ListTile(
                  title: Text("${e['name']}  x${e['qty']}"),
                  trailing: Text("₹${e['price'] * e['qty']}"),
                );
              }).toList(),
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Total : ₹${p.total}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: p.cart.isEmpty
                        ? null
                        : () {
                      p.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order Placed Successfully"),
                        ),
                      );
                    },
                    child: const Text("Place Order"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
