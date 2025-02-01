import 'package:flutter/material.dart';
import 'package:me/component/wonky_char.dart';

import '../../component/wonky_anim_palette.dart';
import '../../const.dart';
import '../../util/buttons/buttons.dart';

class AboutProject extends StatelessWidget {
  final bool isVisble;
  final String label;
  final String description;
  final VoidCallback onPressed;
  const AboutProject(
      {super.key, required this.isVisble, required this.label, required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedOpacity(
        duration: Durations.extralong4,
        opacity: isVisble ? 1 : 0,
        child: AnimatedAlign(
          duration: Durations.medium4,
          alignment: isVisble ? Alignment.topCenter : Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      child: WonkyChar(
                        text: "01",
                        size: 120,
                        animDurationMillis: 10000,
                        animationSettings: [
                          WonkyAnimPalette.weight(
                            from: 600,
                            to: 900,
                            curve: Curves.easeInOut,
                          ),
                          WonkyAnimPalette.descenderDepth(
                            from: -1000,
                            to: -138,
                          ),
                          WonkyAnimPalette.opticalSize(),
                          WonkyAnimPalette.grade(),
                          WonkyAnimPalette.color(
                              from: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                              to: Theme.of(context).colorScheme.tertiaryContainer.withAlpha(100)),
                          WonkyAnimPalette.thickStroke(),
                          WonkyAnimPalette.offsetY(from: 40, to: 20)
                        ],
                      ),
                    ),
                    Text("jjhjhjhjhdjfhjhbjjkgbhgjk"),
                    Text("Himanshu Singhaljhfjhfhh"),
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
}
