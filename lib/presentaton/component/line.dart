import 'package:flutter/material.dart';
import 'package:me/const.dart';

class Line extends StatefulWidget {
  const Line({super.key});

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 3), animationBehavior: AnimationBehavior.preserve);
    animationController.addListener(() => setState(() {}));

    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 2,
          height: Tween<double>(begin: 0, end: screenHeight * .5)
              .animate(CurvedAnimation(parent: animationController, curve: Interval(0, 0.5, curve: Curves.fastLinearToSlowEaseIn)))
              .value,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        Container(
          width: 4,
          height: Tween<double>(begin: 0, end: screenHeight * .5)
              .animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1, curve: Curves.fastLinearToSlowEaseIn)))
              .value,
          color: theme.scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
