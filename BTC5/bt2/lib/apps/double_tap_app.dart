import 'package:flutter/material.dart';
import '../views/double_tap_screen.dart';

class DoubleTapApp extends StatelessWidget {
  const DoubleTapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DoubleTapScreen(),
    );
  }
}