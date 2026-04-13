import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/about_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Company App',
      // Định nghĩa các Named Routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}