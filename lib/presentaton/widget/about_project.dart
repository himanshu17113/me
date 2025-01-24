import 'package:flutter/material.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Himanshu Singhaljhfjhfhh"),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [Text("fdghdfh", style: TextStyle(fontSize: 38)), Text("jjhjhjhjhdjfhjhbjjkgbhgjk")],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
