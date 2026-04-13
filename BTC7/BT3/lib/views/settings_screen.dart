import 'package:flutter/material.dart';
import '../widgets/user_card.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Screen"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          UserCard(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cấu hình hệ thống", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Quay lại màn hình trước đó
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text("Back to Home"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}