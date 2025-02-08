import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/presentaton/about/widget/hobby_items.dart';
import 'package:me/presentaton/component/typer.dart';
import 'package:me/typo.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'package:visibility_detector/visibility_detector.dart';

class Backgound extends StatelessWidget {
  const Backgound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.04, screenHeight * 0.05, screenWidth * (screenWidth > 1000 ? 0.1 : 0.04), 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(
              title: "Background",
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * (screenWidth > 1000 ? 0.05 : 0), top: 10, bottom: screenHeight * 0.04 + 10),
              child: Text(
                  "I am a Flutter and Native Android developer with three years of experience, specializing in building high-quality, cross-platform applications. I have gained extensive experience in developing applications by learning from both my successes 💡 and mistakes❗️.",
                  style: textStyle(
                    fontSize: 32.0,
                    wght: 120,
                    fontFamily: "Rubik",
                  )),
            ),
            const HorizontalLine(
              title: "journey",
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05, top: 10, bottom: screenHeight * 0.04 + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "I started my coding journey by clearing my basics—data structures, algorithms and the thrill and frustration of solving problems. From there, I dove into the Colored side of development and started doing native Android development, crafting apps that blended logic and creativity. Eager to learn new frameworks, I transitioned to Flutter,mastering Firebase, Sockets and REST API integrations while adhering to best practices in state management, dependency injection, and modular. By my second year, I was applying these skills in the real world: first interning as a Flutter Developer at Hansraj Ventures, then contributing to sbazar at Daigo",
                      style: textStyle(
                        fontSize: 28,
                        wght: 120,
                        fontFamily: "Rubik",
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text("What I Love To Do",
                        style: textStyle(
                          fontSize: 46.0,
                          wght: 500,
                          fontFamily: "SourGummy",
                        )),
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 20,
                    children: [
                      HobbyItem(icon: Icons.code, label: "Learning new technology"),
                      HobbyItem(icon: Icons.music_note_outlined, label: "Song"),
                      HobbyItem(icon: Icons.coffee_maker_outlined, label: "Coffee"),
                      HobbyItem(icon: Icons.auto_stories, label: "Listening Audio Book"),
                      HobbyItem(icon: Icons.local_movies, label: "Movies"),
                      HobbyItem(icon: Icons.explore_outlined, label: "Exploaring new \n science discovery"),
                    ],
                  )
                ],
              ),
            ),
            const HorizontalLine(
              title: "tools",
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I use a bunch of tools and technologies to make design and implementation process easier.",
                    style:
                        textStyle(fontSize: 26, wght: 400, fontFamily: "Rubik", wordSpacing: 1.27, letterSpacing: 1.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Row(spacing: 16, children: [
                      Text(
                        "My favorite choice of weapon is   ",
                        style: textStyle(fontSize: 26, fontFamily: "SourGummy", wght: 200),
                      ),
                      const FlutterLogo(),
                    ]),
                  ),
                  Wrap(
                    children: tools
                        .map((x) => VectorGraphic(
                              loader: AssetBytesLoader(x),
                              colorFilter: ColorFilter.mode(Color(0xFF70ABE6), BlendMode.srcIn),
                              width: 300,
                              height: 300,
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalLine extends StatefulWidget {
  final String title;
  const HorizontalLine({super.key, required this.title});

  @override
  State<HorizontalLine> createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  bool visibily = false;
  bool show = true;
  late final int length;
  @override
  void initState() {
    length = widget.title.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.title),
      onVisibilityChanged: (info) {
        if (mounted) {
          if (visibily != (info.visibleFraction > .001)) {
            setState(
              () {
                debugPrint("set sttate");
                visibily = (info.visibleFraction > .001);
                if (!visibily) {
                  show = true;
                }
              },
            );
          }
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
              width: visibily ? (screenWidth * 0.06) : 1,
            ),
            SizedBox(
              width: length * 20,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  TypeText(
                    visibily ? " ${widget.title}" : "",
                    typingSpeed: 10,
                    // showCursor: true,
                    style: TextStyle(fontFamily: "noe", fontSize: 28),
                    //   duration: Duration(milliseconds: length * 100),
                    delayBeforeStart: Duration(milliseconds: length * 100 + 250),
                  ),
                  Align(
                    alignment: show ? Alignment.centerLeft : Alignment.centerRight,
                    child: AnimatedContainer(
                      height: 20,
                      onEnd: () => show
                          ? setState(
                              () => show = false,
                            )
                          : null,
                      duration: Duration(milliseconds: length * 100),
                      color: Colors.black,
                      curve: Curves.easeInCubic,
                      width: show && visibily ? length * 20 : 0,
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
