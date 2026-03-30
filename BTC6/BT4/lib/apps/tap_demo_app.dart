import 'package:flutter/material.dart';
import '../views/booking_view.dart';

class TapDemoApp extends StatelessWidget {
  const TapDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tap Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TapCounterScreen(),
    );
  }
}