import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/const.dart';
import 'package:me/main.dart';
import 'constants.dart';

class Lhome extends StatelessWidget {
  final ScrollController scrollController;
  const Lhome({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        padding: EdgeInsets.symmetric(
            horizontal: mediaQueryData.size.width * .05, vertical: mediaQueryData.size.height * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              //  width: mediaQueryData.size.width - 100,
              height: mediaQueryData.size.height * .9 - 80,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  height: mediaQueryData.size.height * .9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HELLO, MY NAME IS HIMANSHU",
                          style: TextStyle(
                              fontSize: context.layout.value(xs: 13, sm: 20, md: 28, lg: 32, xl: 40),
                              fontFamily: "Rubik",
                              color: colorSelected != ColorSeed.white
                                  ? Theme.of(context).colorScheme.inversePrimary
                                  : Color.fromARGB(255, 255, 20, 71),
                              fontWeight: FontWeight.bold,
                              fontVariations: <FontVariation>[FontVariation('wght', 450.0)],
                              decoration: TextDecoration.none)),
                      // const Text("I am", style: displaySmall),
                      // const Text("Himanshu S.", style: headlineLarge),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
                        child: SizedBox(
                          //height: mediaQueryData.size.height * .5,
                          width: mediaQueryData.size.width * .7,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text("I make mobile apps.",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 112,
                                    fontFamily: "noe",
                                    fontWeight: FontWeight.bold,
                                    fontVariations: <FontVariation>[FontVariation('wght', 1200.0)],
                                    decoration: TextDecoration.none)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaQueryData.size.width * .85,
                        child: Text(
                            "I'm a mobile application developer, Who is Git-committed to blending creativity and functionality into every app.",
                            maxLines: 6,
                            style: TextStyle(
                              fontSize: context.layout.value(xs: 28, sm: 38, md: 46, lg: 48, xl: 60),
                              fontFamily: "Rubik",
                              fontVariations: <FontVariation>[FontVariation('wght', 380.0)],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
