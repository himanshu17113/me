import 'package:flutter/material.dart';
import '../../../const.dart';
import '../../../typo.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.title,
    required this.description,
    required this.down,
    super.key,
  });
  final String title;
  final String description;
  final bool down;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOut,
      duration: Durations.extralong2,
      builder: (context, value, child) => Padding(
            padding: !down ? EdgeInsets.only(top: 24.0 * (1 - value), bottom: 24.0 * value) : EdgeInsets.only(top: 24.0 * value, bottom: 24.0 * (1 - value)),
            child: Opacity(opacity: value, child: Specification(title: title, description: description)),
          ));
}

class Specification extends StatelessWidget {
  const Specification({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 7,
            margin: EdgeInsets.only(right: 26, top: 14, left: screenWidth * 0.05 + 14),
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: theme.colorScheme.secondary),
          ),
          Expanded(
              child: RichText(
            text: TextSpan(
              style: TextStyle(height: 1.6, color: theme.colorScheme.onSurface),
              children: <TextSpan>[
                TextSpan(text: '$title ', style: textStyle(fontSize: 22, fontweight: FontWeight.w600, letterSpacing: 1.6)),
                TextSpan(text: description, style: textStyle(fontFamily: "Rubik", fontSize: 22, wght: 380)),
              ],
            ),
          )),
        ],
      );
}
