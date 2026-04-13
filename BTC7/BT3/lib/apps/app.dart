import 'package:flutter/material.dart';
import '../views/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeScreen(), // Chỉ định màn hình khởi đầu trực tiếp
    );
  }
}