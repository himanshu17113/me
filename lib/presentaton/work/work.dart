import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
    colorScheme = theme.colorScheme;
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: const HomeAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          cacheExtent: 10000,
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
            SizedBox(
              width: screenWidth * .8,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  "Work Experience",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 82,
                    fontFamily: "noe",
                    fontWeight: FontWeight.bold,
                    fontVariations: <FontVariation>[FontVariation('wght', 1200.0)],
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.6,
            ),
          ],
        ));
  }
}
