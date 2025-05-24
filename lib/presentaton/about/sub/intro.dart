import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/presentaton/component/typer.dart';
import 'package:me/typo.dart';
import '../../component/line.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.04),
            child: SizedBox(
              child: Column(
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "  About",
                        style: textStyle(fontSize: 24),
                      )),
                  Expanded(flex: 6, child: Line())
                ],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              SizedBox(
                width: screenWidth * ( .45),
                child: TypeText(
                    "I specialize in mobile technologies and am passionate about developing scalable, high-quality applications with exceptional user experiences.",
                    textAlign: TextAlign.center,
                    style: textStyle(fontSize: 48, height: 1.38, fontFamily: "SourGummy", wght: 200),
                    duration: Duration(seconds: 3)),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
