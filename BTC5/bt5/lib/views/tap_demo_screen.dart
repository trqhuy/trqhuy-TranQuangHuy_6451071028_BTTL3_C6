import 'package:flutter/material.dart';

class CustomSliderScreen extends StatefulWidget {
  const CustomSliderScreen({super.key});

  @override
  State<CustomSliderScreen> createState() => _CustomSliderScreenState();
}

class _CustomSliderScreenState extends State<CustomSliderScreen> {
  double _value = 0; // giá trị từ 0 -> 100
  double _position = 0; // vị trí nút (px)

  final double _sliderWidth = 300;

  void _updatePosition(Offset localPosition) {
    double dx = localPosition.dx;

    // Giới hạn trong thanh slider
    if (dx < 0) dx = 0;
    if (dx > _sliderWidth) dx = _sliderWidth;

    setState(() {
      _position = dx;
      _value = (_position / _sliderWidth) * 100; // convert ra %
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Slider"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Value: ${_value.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40),

            GestureDetector(
              onHorizontalDragUpdate: (details) {
                _updatePosition(details.localPosition);
              },
              child: Container(
                width: _sliderWidth,
                height: 50,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    // Thanh nền
                    Positioned(
                      top: 20,
                      child: Container(
                        width: _sliderWidth,
                        height: 6,
                        color: Colors.grey,
                      ),
                    ),

                    // Thanh đã kéo
                    Positioned(
                      top: 20,
                      child: Container(
                        width: _position,
                        height: 6,
                        color: Colors.blue,
                      ),
                    ),

                    // Nút tròn
                    Positioned(
                      left: _position - 10,
                      top: 15,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}