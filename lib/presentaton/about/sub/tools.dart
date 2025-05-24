import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';
import 'package:me/util/extensions/extensions.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../widget/tile.dart';

class Tools extends StatelessWidget {
  const Tools({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.02, screenHeight * 0.05, screenWidth * (context.isDesktop ? 0.1 : 0.04), 0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(
              title: "tools",
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I use a bunch of tools and technologies to make design and implementation process easier.",
                    style: textStyle(fontSize: 26, wght: 400, fontFamily: "Rubik", wordSpacing: 1.27, letterSpacing: 0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(spacing: 16, children: [
                      Text(
                        "My favorite choice of weapon is",
                        style: textStyle(fontSize: 26, fontFamily: "SourGummy", wght: 200),
                      ),
                      const FlutterLogo(),
                    ]),
                  ),
                ],
              ),
            ),
            Skills(
              header: "Language",
              childs: language,
            ),
            Skills(
              header: "Framework",
              childs: frameworkPlatform,
            ),
            Skills(
              header: "Library",
              childs: library,
            ),
            Skills(
              header: "Editors",
              childs: editors,
            ),
            Skills(
              header: "Services",
              childs: services,
            ),
            Skills(
              header: "Version Control",
              childs: tools,
            ),
          ],
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({
    super.key,
    required this.header,
    required this.childs,
  });
  final String header;
  final List<String> childs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.02, top: 6, bottom: 6),
      child: Column(
        spacing: 8,
        children: [
          HorizontalLine(
            title: header,
            size: 28,
          ),
          Wrap(
            spacing: 10 + mediaQueryData.size.width * 0.02,
            runSpacing: 10 + mediaQueryData.size.width * 0.02,
            children: childs
                .map((x) => Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: mediaQueryData.size.width * 0.008 + 2,
                      children: [
                        VectorGraphic(
                          loader: AssetBytesLoader(x),
                          //  colorFilter: ColorFiltr.mode(Color(0xFF70ABE6), BlendMode.srcIn),
                          height: 20 + mediaQueryData.size.width * 0.02,
                          width: 20 + mediaQueryData.size.width * 0.02,
                        ),
                        Text(
                          x.formatFileName,
                          style: textStyle(fontSize: 22),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
