import 'package:flutter/material.dart';
import '../apps/route_manager.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<User> users = const [
    User(
      name: 'Nguyễn Văn A',
      email: 'vana@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?u=a',
    ),
    User(
      name: 'Trần Thị B',
      email: 'thib@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?u=b',
    ),
    User(
      name: 'Lê Văn C',
      email: 'vanc@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?u=c',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách người dùng')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteManager.profile,
                arguments: user,
              );
            },
          );
        },
      ),
    );
  }
}
