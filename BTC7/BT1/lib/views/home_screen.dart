import 'package:flutter/material.dart';
import '../widgets/user_info.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          UserInfoWidget(), // Hiển thị thông tin SV
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Chuyển sang màn hình About bằng Named Route
                  Navigator.pushNamed(context, '/about');
                },
                child: Text("Go to About"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}