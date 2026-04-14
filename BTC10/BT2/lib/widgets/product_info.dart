import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(product.image, height: 200, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          Text(
            product.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          const Text("Mô tả:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}