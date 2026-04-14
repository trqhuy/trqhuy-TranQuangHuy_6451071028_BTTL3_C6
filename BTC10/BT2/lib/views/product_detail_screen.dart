import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/api_service.dart';
import '../widgets/product_info.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    // Lấy sản phẩm ID số 1
    futureProduct = ApiService().fetchProductDetail(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết sản phẩm")),
      body: Column(
        children: [
          // Dòng thông tin sinh viên bắt buộc
          Container(
            width: double.infinity,
            color: Colors.orangeAccent,
            padding: const EdgeInsets.all(8),
            child: const Text(
              "Trần Quang Huy - 6451071028",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder<Product>(
              future: futureProduct,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Lỗi: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return ProductInfo(product: snapshot.data!);
                }
                return const Center(child: Text("Không có dữ liệu"));
              },
            ),
          ),
        ],
      ),
    );
  }
}