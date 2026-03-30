import 'package:flutter/material.dart';
import '../widgets/my_custom_box.dart';
import '../utils/constants.dart';

class TapDemoScreen extends StatelessWidget {
  const TapDemoScreen({super.key});

  void _showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Long press detected'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hold Demo')),
      body: Center(
        child: GestureDetector(
          onLongPress: () => _showSnackBar(context),
          child: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "Hold me",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}