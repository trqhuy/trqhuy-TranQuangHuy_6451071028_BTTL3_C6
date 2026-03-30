import 'package:flutter/material.dart';

class TapCounterScreen extends StatefulWidget {
  const TapCounterScreen({super.key});

  @override
  State<TapCounterScreen> createState() => _TapCounterScreenState();
}

class _TapCounterScreenState extends State<TapCounterScreen> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tap Counter"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap count: $_count",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _increment,
              child: const Text("Tap Here"),
            ),
          ],
        ),
      ),
    );
  }
}