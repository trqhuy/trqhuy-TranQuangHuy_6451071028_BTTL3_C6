import 'package:flutter/material.dart';
import 'settings_screen.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          UserCard(),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Điều hướng trực tiếp không dùng Named Route
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                child: Text("Go to Settings"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}