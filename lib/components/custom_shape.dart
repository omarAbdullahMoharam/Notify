import 'package:flutter/material.dart';

import '../helpers/constatns.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 550),
      painter: CustomShapePainter(),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kPrimaryColor
      ..style = PaintingStyle.fill;
    double scaleFactor = 1;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * scaleFactor, 0);
    path.lineTo(size.width * scaleFactor, size.height * scaleFactor);
    path.lineTo(0, (size.height - 80) * scaleFactor);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
