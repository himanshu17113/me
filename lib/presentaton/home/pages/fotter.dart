import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isVisible = false;
  bool bgColor = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= 0.5) {
          setState(() {
            isVisible = true;
          });
        } else {
          setState(() {
            isVisible = false;
          });
        }
      },
      key: const ValueKey("footer"),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(0),
              color: Theme.of(context).colorScheme.primaryFixed,
              duration: Durations.medium2,
              width: isVisible ? screenWidth : 10,
              height: screenHeight * .15,
            ),
            AnimatedContainer(
              color: Theme.of(context).colorScheme.primaryFixed,
              duration: Durations.medium4,
              margin: EdgeInsets.all(0),
              width: isVisible ? screenWidth : 0,
              height: screenHeight * .15,
            ),
            AnimatedContainer(
              color: Theme.of(context).colorScheme.primaryFixed,
              duration: Durations.long2,
              margin: EdgeInsets.all(0),
              width: isVisible ? screenWidth : 0,
              height: screenHeight * .15,
            ),
            AnimatedContainer(
              color: Theme.of(context).colorScheme.primaryFixed,
              duration: Durations.long4,
              margin: EdgeInsets.all(0),
              width: isVisible ? screenWidth : 0,
              height: screenHeight * .15,
            ),
            ColoredBox(
              color: bgColor ? Theme.of(context).colorScheme.onPrimaryFixed : Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                    duration: Durations.extralong2,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: isVisible ? screenWidth : 0,
                    height: screenHeight * .14,
                  ),
                  AnimatedContainer(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                    duration: Durations.extralong3,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: isVisible ? screenWidth : 0,
                    height: screenHeight * .14,
                  ),
                  AnimatedContainer(
                    onEnd: () => setState(() => bgColor = true),
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                    duration: Durations.extralong4,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: isVisible ? screenWidth : 0,
                    height: screenHeight * .14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
