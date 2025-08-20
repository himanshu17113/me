import 'package:flutter/material.dart';

import '../../component/wonky_anim_palette.dart';
import '../../component/wonky_char.dart';
import '../../const.dart';
import '../../typo.dart';
import '../../util/buttons/buttons.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({
    required this.isVisble, required this.label, required this.description, required this.onPressed, required this.colorTypr, super.key,
  });
  final bool isVisble;
  final String label;
  final String description;
  final VoidCallback onPressed;
  final int colorTypr;

  @override
  Widget build(BuildContext context) => SizedBox(
      // height: 100,
      child: AnimatedOpacity(
        duration: Durations.extralong4,
        opacity: isVisble ? 1 : 0,
        child: AnimatedAlign(
          duration: Durations.medium4,
          alignment: isVisble ? Alignment.topCenter : Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    WonkyChar(
                      text: "01",
                      size: 120,
                      animDurationMillis: 10000,
                      colorTyper: colorTypr,
                      animationSettings: [
                        WonkyAnimPalette.weight(
                          from: 500,
                          to: 900,
                        ),
                        WonkyAnimPalette.descenderDepth(
                          from: -1000,
                        ),
                        WonkyAnimPalette.opticalSize(),
                        WonkyAnimPalette.grade(),
                        WonkyAnimPalette.thickStroke(),
                        WonkyAnimPalette.offsetY(from: 115, to: 90, curve: Curves.easeOutCubic)
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notee personal Management Tool",
                          style: headlineLarge,
                        ),
                        Text(
                          "Notee is personal Mangemant tool",
                          style: titleBig,
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: HoverButton(
                    isRounded: false,
                    onPressed: () {},
                    label: " Veiw Project ",
                    icon: Icons.arrow_right_alt_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
