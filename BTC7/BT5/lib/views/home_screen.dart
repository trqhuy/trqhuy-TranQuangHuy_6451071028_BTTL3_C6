import 'package:flutter/material.dart';
import 'pick_color_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Màu mặc định ban đầu là màu xám
  Color _selectedColor = Colors.grey;

  // Hàm điều hướng và nhận dữ liệu trả về
  Future<void> _navigateAndPickColor(BuildContext context) async {
    // Đợi kết quả từ Navigator.pop
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PickColorScreen()),
    );

    // Nếu kết quả trả về không null, cập nhật lại giao diện
    if (result != null && result is Color) {
      setState(() {
        _selectedColor = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen - MSSV: 6451071028'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Màu hiện tại của bạn:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            // Box hiển thị màu
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _selectedColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12, width: 2),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _navigateAndPickColor(context),
              icon: const Icon(Icons.colorize),
              label: const Text('Pick Color'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            ),
          ],
        ),
      ),
    );
  }
}