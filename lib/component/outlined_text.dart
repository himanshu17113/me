import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.strokeColor,
    required this.textColor,
    this.strokeWidth = 4,
    this.letterSpacing = 1,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final double fontSize;
  final double letterSpacing;
  final Color strokeColor;
  final Color textColor;
  final double strokeWidth;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Stroked text as border.
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor,
        ),
      ),
    ]);
  }
}
