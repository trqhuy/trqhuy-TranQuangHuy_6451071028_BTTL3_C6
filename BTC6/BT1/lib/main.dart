import 'package:flutter/material.dart';
import 'views/registration_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const RegistrationView(),
      debugShowCheckedModeBanner: false,
    );
  }
}