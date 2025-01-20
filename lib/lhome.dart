import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/main.dart';
import 'package:me/util/extensions/extensions.dart';
import 'constants.dart';
import 'util/buttons/buttons.dart';

class Lhome extends StatelessWidget {
  final ScrollController scrollController;
  const Lhome({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .05,
        vertical: screenHeight * .05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: screenHeight * .9 - 80,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                height: screenHeight * .9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HELLO, MY NAME IS HIMANSHU",
                      style: TextStyle(
                        fontSize: context.layout.value(xs: 13, sm: 20, md: 28, lg: 32, xl: 40),
                        fontFamily: "Rubik",
                        color: colorSelected != ColorSeed.white
                            ? Theme.of(context).colorScheme.inversePrimary
                            : const Color.fromARGB(255, 255, 20, 71),
                        fontWeight: FontWeight.bold,
                        fontVariations: const <FontVariation>[FontVariation('wght', 450.0)],
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: SizedBox(
                        width: screenWidth * .75,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "I make mobile apps.",
                            maxLines: 1,
                            style: TextStyle(
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
                          fontSize: context.layout.value(xs: 28, sm: 38, md: 46, lg: 48, xl: 60),
                          fontFamily: "Rubik",
                          fontVariations: const <FontVariation>[FontVariation('wght', 380.0)],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: context.isMobile,
                      child: HoverButton(
                        onPressed: () {},
                        icon: Icons.arrow_right_alt,
                        label: "SEE MY WORK",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
