import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/util/extensions/layout_adapter_ex.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isVisble = false;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return VisibilityDetector(
      key: Key("projects"),
      onVisibilityChanged: (info) {
        if (isVisble != (20 <= info.visibleFraction * 100)) {
          setState(() {
            isVisble = (20 <= info.visibleFraction * 100);
          });
        }
      },
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Durations.medium1,
              width: !isVisble
                  ? 0
                  : screenWidth > 1000
                      ? screenWidth * .35
                      : screenWidth * 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(36))),
              child: Text(
                "My Projects",
                maxLines: 1,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: context.layout.value(xs: 26, sm: 34, md: 48, lg: 52, xl: 58),
                  fontFamily: "noe",
                  fontWeight: FontWeight.bold,
                  fontVariations: <FontVariation>[FontVariation('wght', 1200.0)],
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Durations.extralong2,
              height: 400,
              width: !isVisble ? 0 : screenWidth,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: !isVisble ? 0 : screenWidth * .1),
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    height: 340,
                    width: screenWidth * 0.5,
                  ),
                  AnimatedAlign(
                    alignment: isVisble ? Alignment.centerRight : Alignment.centerLeft,
                    duration: Durations.extralong4,
                    child: Container(
                      color: Theme.of(context).colorScheme.surfaceContainerLowest,
                      height: 340,
                      width: screenWidth * 0.28,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
