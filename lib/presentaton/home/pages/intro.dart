import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../../../typo.dart';
import '../../../util/buttons/buttons.dart';
import '../../widget/animated_hover_link.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: screenWidth,
        alignment: Alignment.centerLeft,
        //  margin: EdgeInsets.only(right: 100),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .03, vertical: screenHeight * .07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: screenWidth * .1),
            Text(
              "HELLO, MY NAME IS HIMANSHU",
              style: textStyle(
                fontSize: 32,
                fontFamily: "Rubik",
                color: colorSelected != ColorSeed.white
                    ? themeMode == ThemeMode.light
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primaryFixed
                    : const Color.fromARGB(255, 255, 20, 71),
                wght: 450,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SizedBox(
                width: screenWidth * .8,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "I make mobile apps.",
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 112,
                      fontFamily: "noe",
                      fontWeight: FontWeight.bold,
                      fontVariations: const <FontVariation>[FontVariation('wght', 1200)],
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * .85,
              child: Text(
                "I'm a mobile application developer, Who is Git-committed to blending creativity and functionality into every app.",
                maxLines: 6,
                style: textStyle(height: 1.1, fontSize: 48, fontFamily: "Rubik", wght: 320),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04, bottom: screenHeight * 0.02),
              child: HoverButton(
                onPressed: () {},
                icon: Icons.arrow_right_alt,
                label: "SEE MY WORK",
              ),
            ),
            SizedBox(height: screenWidth * .02), //   Spacer(),
            Row(
              children: [
                HoveLink(label: "Git Hub", onPressed: () {}),
                //    slash(context),
                HoveLink(label: "Linkdin", onPressed: () {}),
                //  slash(context),
                HoveLink(label: "Resume", onPressed: () {}),
              ],
            ),
          ],
        ),
      );
}
