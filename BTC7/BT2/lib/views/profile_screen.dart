import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;

    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin cá nhân')),
      body: Center(
        child: user == null
            ? const Text('Không tìm thấy thông tin người dùng')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  const SizedBox(height: 20),
                  const Text('Xin chào,', style: TextStyle(fontSize: 20)),
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Quay về'),
                  ),
                ],
              ),
      ),
    );
  }
}
