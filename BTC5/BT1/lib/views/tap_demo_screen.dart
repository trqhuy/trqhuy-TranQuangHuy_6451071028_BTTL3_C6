import 'package:flutter/material.dart';
import '../widgets/my_custom_box.dart';
import '../utils/constants.dart';

class TapDemoScreen extends StatelessWidget {
  const TapDemoScreen({super.key});

  void _showSnackBar(BuildContext context) {
    final snackBar = const SnackBar(
      content: Text('You tapped the box!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap Demo'),
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
            MyCustomBox(onTap: () => _showSnackBar(context)),
          ],
        ),
      ),
    );
  }
}