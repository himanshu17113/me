import 'package:flutter/material.dart';
import 'package:me/util/extensions/path_ex.dart';

class FooterPath extends StatelessWidget {
  const FooterPath({
    super.key,
    required this.color,
    required this.animation,
  });
  final Color color;
  final double animation;
  @override
  Widget build(BuildContext context) => CustomPaint(
          painter: AnimatedPathPainter(
        animation,
        color: color,
      ));
}

class AnimatedPathPainter extends CustomPainter {
  final double _animation;
  final Color color;
  final double strokeWidth;
  AnimatedPathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 5.0,
  }) : super();

  Path _createAnyPath(Size size) {
    double height = size.height;
    double width = size.width;
    return Path()
      ..moveTo(0, height * 0.5)
      ..quadraticBezierTo(width / 2, height, width / 2, height * 0.5)
      ..quadraticBezierTo(width / 2, 0, width, height * 0.3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation;
    final path = _createAnyPath(size).createAnimatedPath(animationPercent);

    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
