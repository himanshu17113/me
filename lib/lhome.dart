import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';

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
              //     width: mediaQueryData.size.width,
              height: mediaQueryData.size.height * .9,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: mediaQueryData.size.height * .9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("I am", style: displaySmall),
                          const Text("Himanshu S.", style: headlineLarge),
                          SizedBox(
                            height: mediaQueryData.size.height * .2,
                            width: mediaQueryData.size.width * .75,
                            child: const FittedBox(
                              alignment: Alignment.centerLeft,
                              // fit: BoxFit.fitHeight,
                              child: Text(
                                "A Frontend Engineer. I Help\nStartups to Devlope And Grow\nTheir Products.",
                                style: displaySmall,
                                maxLines: 3,
                              ),
                            ),
                          ),
                          //   const Spacer(),
                          SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                const Text("Building Apps for ", style: titleLarge),
                                AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText('Mac', textStyle: headlineSmall),
                                    RotateAnimatedText('Android', textStyle: headlineSmall),
                                    RotateAnimatedText('iOS', textStyle: headlineSmall),
                                    RotateAnimatedText('Web', textStyle: headlineSmall),
                                    RotateAnimatedText('Linux', textStyle: headlineSmall),
                                    RotateAnimatedText('Windows', textStyle: headlineSmall),
                                  ],
                                  // onTap: () {
                                  //   print("Tap Event");
                                  // },
                                ),
                              ],
                            ),
                          ),
                          const Text("Using Flutter & Kotlin", style: headlineSmall)
                        ],
                      ),
                    ),
                    // Visibility(
                    //   visible: mediaQueryData.size.width > 1000,
                    //   child: SvgPicture.asset(
                    //     'asset/md.svg',
                    //     // height: mediaQueryData.size.height * 0.6,
                    //     width: mediaQueryData.size.width * 0.3,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
