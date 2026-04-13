import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dữ liệu mẫu
  final List<Product> products = const [
    Product(name: 'iPhone 15 Pro', price: 999.0, description: 'Apple flagship smartphone.'),
    Product(name: 'MacBook Air M2', price: 1199.0, description: 'Thin and light laptop.'),
    Product(name: 'AirPods Pro', price: 249.0, description: 'Noise cancelling earbuds.'),
    Product(name: 'iPad Pro', price: 799.0, description: 'Powerful tablet for professionals.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List - MSSV: 6451071028'), // THAY MSSV CỦA BẠN TẠI ĐÂY
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return ProductItem(
            product: p,
            onTap: () {
              // Điều hướng và truyền dữ liệu sang DetailScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(product: p),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
