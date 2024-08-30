import 'package:flutter/material.dart';

class DrawDottedHorizontalLine extends CustomPainter {
Paint? _paint;
DrawDottedHorizontalLine() {
  _paint = Paint();
  _paint!.color = Colors.black; //dots color
  _paint!.strokeWidth = 2; //dots thickness
  _paint!.strokeCap = StrokeCap.square; //dots corner edges
}

@override
void paint(Canvas canvas, Size size) {
  for (double i = -300; i < 300; i = i + 15) {
    // 15 is space between dots
    if (i % 3 == 0) {
      canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint!);
    }
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
}