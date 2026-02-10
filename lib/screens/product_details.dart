import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product p;
  ProductDetails(this.p);

  @override
  Widget build(BuildContext context) {
    bool land =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Widget image = Image.network(p.image);
    Widget details = Column(
      children: [
        Text(p.name, style: TextStyle(fontSize: 22)),
        Text("₹${p.price}")
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: land
          ? Row(children: [Expanded(child: image), Expanded(child: details)])
          : Column(children: [image, details]),
    );
  }
}
