import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';

import '../../component/typer.dart';

class HorizontalLine extends StatelessWidget {
  final String title;
  final double size;
  final EdgeInsets? edgeInsets;

  static const _animationDuration = Duration(seconds: 3);
  static const _lineHeight = 2.0;
  static const _titlePadding = 22.0;
  static const _maskHeight = 32.0;
  static const _maskWidthFactor = 20.0;
  static const _lineWidthFactor = 0.04;
  static const _lineWidthOffset = 10.0;

  const HorizontalLine({
    super.key,
    required this.title,
    this.size = 36,
    this.edgeInsets,
  });

  @override
  Widget build(BuildContext context) {
    final int titleLength = title.length;
    screenWidth = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder<double>(
      duration: _animationDuration,
      curve: Curves.ease,
      tween: Tween<double>(begin: 0, end: 3),
      builder: (context, animationValue, child) {
        // Animation phases:
        // 0-1: Line grows
        // 1-2: Mask slides left
        // 2-3: Mask slides right, text revealed
        final bool isMaskSlidingLeft = animationValue > 1 && animationValue < 2;
        final double lineWidth = (screenWidth * _lineWidthFactor + _lineWidthOffset) * (animationValue.clamp(0, 1));
        final double maskWidth = animationValue < 1 ? 0 : titleLength * _maskWidthFactor * (isMaskSlidingLeft ? (animationValue - 1) : (3 - animationValue));

        return Row(
          children: [
            Container(
              height: _lineHeight,
              margin: edgeInsets,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: lineWidth,
            ),
            SizedBox(
              width: titleLength * _titlePadding,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  if (animationValue > 2)
                    TypeText(
                      " $title",
                      typingSpeed: 10,
                      style: textStyle(fontFamily: "noe", fontSize: size, height: 1),
                    ),
                  Align(
                    alignment: isMaskSlidingLeft ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      height: _maskHeight,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      width: maskWidth,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
