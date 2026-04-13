import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên sản phẩm: ${product.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Giá: \$${product.price}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mô tả chi tiết:',
              style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 10),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Center(
              child: Text(
                'MSSV: 12345678', // THAY MSSV CỦA BẠN TẠI ĐÂY
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}