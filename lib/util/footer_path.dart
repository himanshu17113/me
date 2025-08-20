import 'package:flutter/material.dart';
import 'extensions/path_ex.dart';

class FooterPath extends StatelessWidget {
  const FooterPath({
    required this.color,
    required this.animation,
    super.key,
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
  AnimatedPathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 5.0,
  }) : super();
  final double _animation;
  final Color color;
  final double strokeWidth;

  Path _createAnyPath(Size size) {
    final double height = size.height;
    final double width = size.width;
    return Path()
      ..moveTo(0, height * 0.5)
      ..quadraticBezierTo(width / 2, height, width / 2, height * 0.5)
      ..quadraticBezierTo(width / 2, 0, width, height * 0.3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double animationPercent = _animation;
    final Path path = _createAnyPath(size).createAnimatedPath(animationPercent);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
