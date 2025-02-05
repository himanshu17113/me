import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/presentaton/component/typer.dart';
import 'package:me/typo.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Backgound extends StatelessWidget {
  const Backgound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenHeight * 0.05, screenWidth * 0.1, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(
              title: "Background",
            ),
            Padding(
              padding: EdgeInsets.only(left: (screenWidth * 0.02) + 40, top: 20),
              child: Text(
                  // "I am a Flutter and Native Android developer with three years of experience, specializing in building high-quality, cross-platform applications. Expert in integrating Firebase, Sockets, and REST APIs, while adhering to best practices in state management, dependency injection, and modular architecture. I enjoy turning complex problems into simple, beautiful and intuitive solutions.",
                  //  "I am a Flutter and Native Android developer with three years of experience, specializing in building high-quality, cross-platform applications.I have gained extensive experience in developing applications by learning from both my successes 💡 and mistakes❗️. \n\nI started my coding journey with the clearing my basics—data structures, algorithms, and the thrill and frustration of solving problems. From there, I dove into development and statred doing native Android development, crafting apps that blended logic and creativity with many Colors. Eager to learn new frameWorks, I transitioned to Flutter, mastering cross-platform solutions that work seamlessly across devices. By my second year, I was applying these skills in the real world: first interning as a Flutter Developer at Hansraj Ventures, then contributing to sbazar at Daigo",
                  "I am a Flutter and Native Android developer with three years of experience, specializing in building high-quality, cross-platform applications. I have gained extensive experience in developing applications by learning from both my successes 💡 and mistakes❗️.",
                  style: TextStyle(
                      fontSize: 32.0,
                      height: 1.25,
                      fontFamily: "Rubik",
                      textBaseline: TextBaseline.alphabetic,
                      leadingDistribution: TextLeadingDistribution.even)),
            ),
            const HorizontalLine(
              title: "Journey",
            ),
            Padding(
              padding: EdgeInsets.only(left: (screenWidth * 0.02) + 40, top: 20),
              child: Text(
                  "I started my coding journey by clearing my basics—data structures, algorithms, and the thrill and frustration of solving problems. From there, I dove into development and started doing native Android development, crafting apps that blended logic and creativity with many colors. Eager to learn new frameworks, I transitioned to Flutter, mastering cross-platform solutions that work seamlessly across devices. By my second year, I was applying these skills in the real world: first interning as a Flutter Developer at Hansraj Ventures, then contributing to sbazar at Daigo",
                  style: TextStyle(
                      fontSize: 32.0,
                      height: 1.25,
                      fontFamily: "Rubik",
                      textBaseline: TextBaseline.alphabetic,
                      leadingDistribution: TextLeadingDistribution.even)),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final String title;
  const HorizontalLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    bool visibily = false;
    bool show = true;
    return StatefulBuilder(
        builder: (context, setState) => VisibilityDetector(
              key: ValueKey(title),
              onVisibilityChanged: (info) {
                if (visibily != (info.visibleFraction > .01)) {
                  setState(
                    () {
                      visibily = (info.visibleFraction > .01);
                      if (!visibily) {
                        show = true;
                      }
                    },
                  );
                }
              },
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Durations.medium1,
                      height: 2,
                      color: Colors.black,
                      width: visibily ? (screenWidth * 0.02) + 40 : 1,
                    ),
                    SizedBox(
                      width: 180,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          visibily
                              ? TypeText(
                                  " $title",
                                  style: TextStyle(fontFamily: "noe", fontSize: 28),
                                  duration: Durations.long1,
                                  delayedDuration: Durations.extralong2,
                                )
                              : SizedBox.shrink(),
                          Align(
                            alignment: show ? Alignment.centerLeft : Alignment.centerRight,
                            child: AnimatedContainer(
                              height: 20,
                              onEnd: () => setState(
                                () => show = false,
                              ),
                              duration: Durations.long2,
                              color: Colors.black,
                              curve: Curves.easeInCubic,
                              width: show && visibily ? 180 : 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
