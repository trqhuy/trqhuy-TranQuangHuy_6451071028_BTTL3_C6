import 'package:flutter/material.dart';
import '../models/color_item.dart';

class PickColorScreen extends StatelessWidget {
  const PickColorScreen({super.key});

  // Danh sách các lựa chọn màu sắc
  final List<ColorItem> colorOptions = const [
    ColorItem(name: 'Red (Đỏ)', color: Colors.red),
    ColorItem(name: 'Blue (Xanh dương)', color: Colors.blue),
    ColorItem(name: 'Green (Xanh lá)', color: Colors.green),
    ColorItem(name: 'Orange (Cam)', color: Colors.orange),
    ColorItem(name: 'Purple (Tím)', color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn một màu'),
      ),
      body: ListView.builder(
        itemCount: colorOptions.length,
        itemBuilder: (context, index) {
          final item = colorOptions[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: item.color),
            title: Text(item.name),
            onTap: () {
              // TRẢ DỮ LIỆU VỀ: Đóng màn hình và gửi màu đã chọn đi
              Navigator.pop(context, item.color);
            },
          );
        },
      ),
    );
  }
}