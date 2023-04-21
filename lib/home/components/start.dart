import 'package:flutter/material.dart';
import 'package:guzergah/home/view/home_painter.dart';

class StartButton extends StatelessWidget {
  final height, width;
  StartButton({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CustomPaint(
          painter: StartButtonPainter(),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0)),
              onPressed: () {},
              child: Text(
                "Start",
                style: TextStyle(fontSize: 20),
              ))),
    );
  }
}
