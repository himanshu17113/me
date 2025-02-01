import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/main.dart';
import 'package:me/util/extensions/extensions.dart';
import '../../../const.dart';
import '../../../constants.dart';
import '../../widget/animated_hover_link.dart';
import '../../../util/buttons/buttons.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(
              fontSize: context.layout.value(xs: 18, sm: 24, md: 28, lg: 32, xl: 40),
              fontFamily: "Rubik",
              color: colorSelected != ColorSeed.white
                  ? themeMode == ThemeMode.light
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(context).colorScheme.primaryFixed
                  : const Color.fromARGB(255, 255, 20, 71),
              fontWeight: FontWeight.bold,
              fontVariations: const <FontVariation>[FontVariation('wght', 450.0)],
              decoration: TextDecoration.none,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
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
                    fontVariations: <FontVariation>[FontVariation('wght', 1200.0)],
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
              style: TextStyle(
                height: 1.1,
                fontSize: context.layout.value(xs: 24, sm: 28, md: 46, lg: 48, xl: 60),
                fontFamily: "Rubik",
                fontVariations: const <FontVariation>[FontVariation('wght', 320.0)],
              ),
            ),
          ),
          Visibility(
            visible: context.isMobile,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04, bottom: screenHeight * 0.02),
              child: HoverButton(
                onPressed: () {},
                icon: Icons.arrow_right_alt,
                label: "SEE MY WORK",
              ),
            ),
          ),
          SizedBox(height: screenWidth * .02), //   Spacer(),
          Row(
            children: [
              HoveLink(label: "Git Hub", onPressed: () {}),
             slash(context),
              HoveLink(label: "Linkdin", onPressed: () {}),
            slash(context),
              HoveLink(label: "Resume", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
