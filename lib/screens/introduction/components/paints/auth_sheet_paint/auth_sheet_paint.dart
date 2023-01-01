import 'package:flutter/material.dart';

class AuthSheetPaint extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xff00B4D8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    final Path path = Path();

    path.quadraticBezierTo(size.width * 0.05, size.height * 0.1,
        size.width * 0.25, size.height * 0.1);

    path.lineTo(size.width * 0.8, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.1, size.width, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }
}
