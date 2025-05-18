import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';

class Tile extends StatelessWidget {
  final String title;
  final String description;
  final bool down;
  const Tile({
    super.key,
    required this.title,
    required this.description,
    required this.down,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.easeOut,
        duration: Durations.extralong2,
        builder: (context, value, child) => Padding(
              padding: down ? EdgeInsets.only(top: 24 * (1 - value), bottom: 24 * value) : EdgeInsets.only(top: 24 * value, bottom: 24 * (1 - value)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 7,
                    margin: EdgeInsets.only(right: 26, top: 14, left: screenWidth * 0.05 + 14),
                    height: 7,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: theme.colorScheme.secondary.withAlpha((value * 255).toInt())),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(height: 1.6, color: theme.colorScheme.onSurface.withAlpha((value * 255).toInt())),
                        children: <TextSpan>[
                          TextSpan(text: '$title ', style: textStyle(fontSize: 22, fontweight: FontWeight.w600, letterSpacing: 1.6)),
                          TextSpan(text: description, style: textStyle(fontFamily: "Rubik", fontSize: 22, wght: 380)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
