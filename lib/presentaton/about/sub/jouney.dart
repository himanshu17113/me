import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';
import 'package:me/util/extensions/extensions.dart';
import '../widget/tile.dart';

class Journey extends StatelessWidget {
  const Journey({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.02, screenHeight * 0.05, screenWidth * (context.isDesktop ? 0.1 : 0.04), 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(
              title: "Journey",
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * (context.isDesktop ? 0.05 : 0.01), top: 6, bottom: screenHeight * 0.04 + 10),
              child: Text(
                  "I started my coding journey by clearing my basics—data structures, algorithms and the thrill and frustration of solving problems. From there, I dove into the Colored side of development and started doing native Android development, crafting apps that blended logic and creativity. Eager to learn new frameworks, I transitioned to Flutter,mastering Firebase, Sockets and REST API integrations while adhering to best practices in state management, dependency injection, and modular. By my second year, I was applying these skills in the real world: first interning as a Flutter Developer at Hansraj Ventures, then contributing to sbazar at Daigo",
                  style: textStyle(
                    fontSize: 32.0,
                    wght: 330,
                    height: 1.35,
                    letterSpacing: 0.6,
                    wordSpacing: 0.5,
                    fontFamily: "Rubik",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
