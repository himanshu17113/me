import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:vector_graphics/vector_graphics.dart';
import '../../typo.dart';
import '../../util/animation/FadeAnimation.dart';
import '../about/widget/tile.dart';
import '../widget/appbar.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: HomeAppBar(),
        body: ListView(
          cacheExtent: 0,
          padding: EdgeInsets.only(right: screenWidth * 0.04),
          children: [
            SizedBox(
              height: mediaQueryData.size.width * 0.16,
              // width: mediaQueryData.size.width * 0.1,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: VectorGraphic(
                  loader: AssetBytesLoader(workStump),
                  alignment: Alignment.topRight,
                  colorFilter: ColorFilter.mode(_isHovered ? theme.colorScheme.primaryContainer : theme.colorScheme.inverseSurface, BlendMode.srcIn),
                  height: mediaQueryData.size.width * 0.16,
                  width: mediaQueryData.size.width * 0.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: SizedBox(
                width: screenWidth * .8,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Work Experience",
                    maxLines: 1,
                    style: textStyle(fontSize: 82, fontFamily: "noe", wght: 1200.0),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.6,
              height: 8,
              indent: screenWidth * 0.04,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HorizontalLine(
                  title: "Flutter Developer",
                  edgeInsets: EdgeInsets.symmetric(vertical: mediaQueryData.size.width * 0.018),
                ),
                Text(
                  "06/2024 - Present",
                  style: textStyle(
                    fontSize: 22,
                    fontFamily: "Rubik",
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Unanime Planet · Full-time",
                      style: textStyle(
                        fontSize: 14,
                        color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                        wght: 420,
                        fontFamily: "Rubik",
                      )),
                  Text("Sede Aveiro, Portugal · Remote",
                      style: textStyle(
                        fontSize: 14,
                        color: theme.colorScheme.onSurfaceVariant.withAlpha(180),
                        wght: 420,
                        fontFamily: "Rubik",
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: mediaQueryData.size.width * 0.15, top: mediaQueryData.size.width * 0.02),
                    child: Text(
                      "As the lead developer for the Uprides mobile application, available on both Android and iOS, I managed the complete development lifecycle, from initial design to deployment and ongoing maintenance. Working closely with backend engineers, UI/UX designers, and product managers, I developed and integrated key features that enhanced user experience and performance.",
                      style: textStyle(fontFamily: "Rubik", fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            ...List.generate(
              10,
              (index) => Tile(
                title: "Feature Development:  ",
                description:
                    "User Interaction: Streamlined user workflows, minimizing user inputs while maintaining functionality, and implemented intuitive navigation flows.Pro",
              ),
            )
          ],
        ));
  }
}

class Tile extends StatelessWidget {
  final String title;
  final String description;
  const Tile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.easeOut,
        duration: Duration(seconds: 1),
        builder: (context, value, child) => Padding(
              padding: EdgeInsets.only(top: 24 * (1 - value), bottom: 24 * value),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 7,
                    margin: EdgeInsets.only(right: 26, top: 14, left: screenWidth * 0.05 + 14),
                    height: 7,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: theme.colorScheme.secondary.withAlpha((value * 255).toInt())),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(height: 1.6, color: theme.colorScheme.onSurface.withAlpha((value * 255).toInt())),
                        children: <TextSpan>[
                          TextSpan(text: '$title ', style: textStyle(fontSize: 22, fontweight: FontWeight.w600, letterSpacing: 1.6)),
                          TextSpan(text: description, style: textStyle(fontFamily: "Rubik", fontSize: 22, wght: 380)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
