import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/presentaton/component/typer.dart';

import '../../component/line.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.01),
          SizedBox(
            child: Column(
              children: [
                Spacer(
                  flex: 5,
                ),
                RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "  About",
                      style: TextStyle(fontSize: 24),
                    )),
                Expanded(flex: 6, child: Line())
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          SizedBox(
            width: screenWidth * .45,
            child: TypeText(
                "I specialize in mobile technologies and am passionate about developing scalable, high-quality applications with exceptional user experiences.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  height: 1.38,
                  fontFamily: "SourGummy",
                  fontVariations: <FontVariation>[FontVariation('wght', 200.0)],
                ),
                duration: Duration(seconds: 6)),
          )
        ],
      ),
    );
  }
}
