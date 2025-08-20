import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../const.dart';
import '../../../model/quote.dart';
import '../../../util/footer_path.dart';

final ValueNotifier<bool> isFooterVisiblex = ValueNotifier(false);

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // Decode the JSON string into a Dart object
    final dynamic json = jsonDecode(jsonString);
    final List<Quote> quotes = List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x)))..shuffle();

    return ValueListenableBuilder(
      valueListenable: isFooterVisiblex,
      builder: (context, isFooterVisible, child) => VisibilityDetector(
        onVisibilityChanged: (info) {
          if (info.visibleFraction >= 0.1) {
            isFooterVisiblex.value = true;
            // bgColorx.value = true;
          } else {
            isFooterVisiblex.value = false;
          }
        },
        key: const ValueKey("footer"),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const UpperStipes(),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text('"${quotes.first.quote}"',
                                style: const TextStyle(
                                  fontSize: 42,
                                  height: 1.38,
                                  fontFamily: "SourGummy",
                                  fontWeight: FontWeight.w100,
                                  fontVariations: [FontVariation('wght', 300)],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 84),
                            child: Text("  ~${quotes.first.author}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  height: 1.38,
                                  fontFamily: "SourGummy",
                                  fontWeight: FontWeight.w100,
                                  fontVariations: [FontVariation('wght', 300)],
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const LowerStripes(),
                  if (isFooterVisible)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                          child: Row(
                            spacing: 32,
                            children: [
                              Text("Let's Work together!",
                                  style: TextStyle(
                                    fontSize: 46,
                                    height: 1.38,
                                    fontFamily: "SourGummy",
                                    color: Theme.of(context).colorScheme.primaryFixed,
                                    fontVariations: const [FontVariation('wght', 800)],
                                  )),
                              Expanded(
                                child: SizedBox(
                                  height: screenWidth * 0.16,
                                  child: TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 0, end: 1),
                                      duration: const Duration(seconds: 10),
                                      builder: (context, value, child) => FooterPath(
                                            color: Theme.of(context).colorScheme.primaryFixed,
                                            animation: value,
                                          )),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("- Contact me",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primaryFixed,
                                        fontSize: 22,
                                        height: 1.38,
                                        fontFamily: "SourGummy",
                                        fontWeight: FontWeight.w100,
                                        fontVariations: const [FontVariation('wght', 300)],
                                      )),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: const Text("himanshu17113@gmail.com"),
                                    icon: const Icon(Icons.mail),
                                    style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primaryFixed)),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: const Text("+91 7037-543-555"),
                                    icon: const Icon(Icons.call),
                                    style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primaryFixed)),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: VectorGraphic(
                                          loader: AssetBytesLoader(github),
                                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primaryFixed, BlendMode.srcIn),
                                          //  colorFilter: ColorFiltr.mode(Color(0xFF70ABE6), BlendMode.srcIn),
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: VectorGraphic(
                                          loader: AssetBytesLoader(linkdin),
                                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primaryFixed, BlendMode.srcIn),
                                          //  colorFilter: ColorFiltr.mode(Color(0xFF70ABE6), BlendMode.srcIn),
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            "Build using  ",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.38,
                              fontFamily: "SourGummy",
                              fontWeight: FontWeight.w100,
                              color: Theme.of(context).colorScheme.primaryFixed,
                              fontVariations: const [FontVariation('wght', 300)],
                            ),
                          ),
                          const FlutterLogo(
                            size: 16,
                          )
                        ]),
                        Text(
                          "© 2025 Himanshu Singhal",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.38,
                            color: Theme.of(context).colorScheme.primaryFixed,
                            fontFamily: "SourGummy",
                            fontWeight: FontWeight.w100,
                            fontVariations: const [FontVariation('wght', 300)],
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LowerStripes extends StatelessWidget {
  const LowerStripes({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedContainer(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            duration: Durations.extralong2,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .14,
          ),
          AnimatedContainer(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            duration: Durations.extralong3,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .27,
          ),
          AnimatedContainer(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            duration: Durations.extralong4,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .4,
          ),
        ],
      );
}

class UpperStipes extends StatelessWidget {
  const UpperStipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedContainer(
            alignment: Alignment.topRight,
            color: Theme.of(context).colorScheme.primaryFixed,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            duration: Durations.medium2,
            width: isFooterVisiblex.value ? screenWidth : 10,
            height: screenHeight * .15,
          ),
          AnimatedContainer(
            color: Theme.of(context).colorScheme.primaryFixed,
            duration: Durations.medium4,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .3,
          ),
          AnimatedContainer(
            color: Theme.of(context).colorScheme.primaryFixed,
            duration: Durations.long2,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .45,
          ),
          AnimatedContainer(
            color: Theme.of(context).colorScheme.primaryFixed,
            duration: Durations.long4,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: isFooterVisiblex.value ? screenWidth : 0,
            height: screenHeight * .6,
          ),
        ],
      );
}
