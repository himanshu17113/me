import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/main.dart';
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
              duration: Durations.extralong4,
              height: 400,
              curve: Curves.easeInOut,
              width: !isVisble ? 0 : screenWidth,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * .06, vertical: screenHeight * .1),
              padding: EdgeInsets.all(!isVisble ? 0 : screenWidth * .02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withAlpha(40),
                      spreadRadius: 2,
                      blurRadius: 18,
                      offset: const Offset(5, 5),
                    ),
                    // const BoxShadow(
                    //     color: Color.fromARGB(119, 255, 255, 255),
                    //     offset: Offset(-2, -2),
                    //     blurRadius: 15,
                    //     spreadRadius: 1),
                  ],
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  //  / alignment: Alignment.centerLeft,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: themeMode == ThemeMode.dark
                              ? null
                              : RadialGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.inversePrimary.withAlpha(135), // Mid color
                                    Theme.of(context).colorScheme.inversePrimary.withAlpha(160), // Mid color
                                    Theme.of(context).colorScheme.inversePrimary.withAlpha(190), // Mid color
                                    Theme.of(context).colorScheme.inversePrimary.withAlpha(225),
                                    Theme.of(context).colorScheme.inversePrimary, // Outer color
                                  ],
                                  stops: [0.2, 0.4, 0.6, 0.8, 1.0], // Control the gradient spread
                                ),
                          color: Theme.of(context).colorScheme.secondaryFixed,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(screenWidth * .02),
                        decoration: BoxDecoration(
                          // color: Theme.of(context).colorScheme.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Text(
                            "jhgfskdlghghsgdhjgjhghjdfghjghjfgshdghjsfghfsghdsghjdgfghgdgfhgsdfghfgfghjdghjdghgdfjh"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
