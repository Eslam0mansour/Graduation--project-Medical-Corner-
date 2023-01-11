import 'package:flutter/material.dart';

class IntroductionDescriptionPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    final path = Path();

    path.moveTo(size.width, size.height * 0.01);
    path.quadraticBezierTo(size.width * 1.05, size.height * 0.15,
        size.width * 0.7, size.height * 0.15);

    path.lineTo(size.width * 0.2, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.15, 0, size.height * 0.25);

    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        0, size.height * 0.9, size.width * 0.2, size.height * 0.9);

    path.lineTo(size.width * 0.7, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.9, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
