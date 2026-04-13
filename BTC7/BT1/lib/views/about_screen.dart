import 'package:flutter/material.dart';
import '../widgets/user_info.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Screen"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          UserInfoWidget(), // Hiển thị thông tin SV
          Expanded(
            child: Center(
              child: Text(
                "About our company",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}