import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../typo.dart';
import '../../component/line.dart';
import '../../component/typer.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.04),
            child: SizedBox(
              child: Column(
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "  About",
                        style: textStyle(fontSize: 24),
                      )),
                  const Expanded(flex: 6, child: Line())
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              SizedBox(
                width: screenWidth *  .45,
                child: TypeText(
                    "I specialize in mobile technologies and am passionate about developing scalable, high-quality applications with exceptional user experiences.",
                    textAlign: TextAlign.center,
                    style: textStyle(fontSize: 48, height: 1.38, fontFamily: "SourGummy", wght: 200),
                    duration: const Duration(seconds: 3)),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
}
