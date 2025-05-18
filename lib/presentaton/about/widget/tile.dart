import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../component/typer.dart';

class HorizontalLine extends StatefulWidget {
  final String title;
  final double size;
  final EdgeInsets? edgeInsets;

  const HorizontalLine({super.key, required this.title, this.size = 36, this.edgeInsets});

  @override
  State<HorizontalLine> createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  bool visibily = false;
  bool show = true;
  late final int length;
  @override
  void initState() {
    length = widget.title.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 3),
      builder: (context, value, child) {
        final bool isleft = value > 1 && value < 2;
        return SizedBox(
          child: Row(
            children: [
              Container(
                height: 2,
                margin: widget.edgeInsets,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: (screenWidth * widget.size * 0.001 + 10) * ((value).clamp(0, 1)),
              ),
              SizedBox(
                width: length * 22,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    value > 2
                        ? TypeText(
                            " ${widget.title}",
                            typingSpeed: 10,
                            style: textStyle(fontFamily: "noe", fontSize: widget.size, height: 1),
                          )
                        : SizedBox.shrink(),
                    Align(
                      alignment: isleft ? Alignment.centerLeft : Alignment.centerRight,
                      child: Container(
                          height: 32,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          width: value < 1 ? 0 : length * 20 * (isleft ? ((value - 1)) : (3 - value))),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
