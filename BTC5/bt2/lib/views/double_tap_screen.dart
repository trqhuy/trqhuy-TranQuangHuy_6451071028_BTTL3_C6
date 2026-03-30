import 'package:flutter/material.dart';
import '../widgets/color_box.dart';
import '../utils/constants.dart';

class DoubleTapScreen extends StatefulWidget {
  const DoubleTapScreen({super.key});

  @override
  State<DoubleTapScreen> createState() => _DoubleTapScreenState();
}

class _DoubleTapScreenState extends State<DoubleTapScreen> {
  bool _isBlue = true;

  void _handleDoubleTap() {
    setState(() {
      _isBlue = !_isBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Double Tap Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.studentId,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ColorBox(
              color: _isBlue ? Colors.blue : Colors.red,
              onDoubleTap: _handleDoubleTap,
            ),
            const SizedBox(height: 20),
            Text(
              "Current Color: ${_isBlue ? 'Blue' : 'Red'}",
              style: const TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}