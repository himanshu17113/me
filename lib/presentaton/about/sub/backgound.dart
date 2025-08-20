import 'package:flutter/material.dart';
import '../../../const.dart';
import '../../../typo.dart';
 
import '../widget/tile.dart';

class Backgound extends StatelessWidget {
  const Backgound({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.02, screenHeight * 0.05, screenWidth * 0.1, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(
              title: "Background",
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth *   0.05 , top: 6, bottom: screenHeight * 0.04 + 10),
              child: Text(
                  "I am a Flutter and Native Android developer with three years of experience, specializing in building high-quality, cross-platform applications. I have gained extensive experience in developing applications by learning from both my successes 💡 and mistakes❗️.",
                  style: textStyle(
                    fontSize: 32,
                    wght: 120,
                    fontFamily: "Rubik",
                  )),
            ),
          ],
        ),
      ),
    );
}
