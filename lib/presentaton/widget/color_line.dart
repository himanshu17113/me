import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/constants.dart';

class ColorLine extends StatelessWidget {
  final ColorSeed colorSelected;
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(int value) handleColorSelect;
  const ColorLine({super.key, required this.colorSelected, required this.handleBrightnessChange, required this.handleColorSelect});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
      // width: mediaQueryData.size.height * 0.066,
      height: mediaQueryData.size.height - 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(child: VerticalDivider()),
          SizedBox(
            height: isLight ? 60 : 40,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                VerticalDivider(
                  color: Colors.deepOrangeAccent,
                  endIndent: 30,
                ),
                Visibility(
                  visible: isLight,
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: LightBulb(),
                ),
                Positioned(bottom: isLight ? 10 : 0, child: IconButton(onPressed: () => handleBrightnessChange(!isLight), icon: const Icon(Icons.light))),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
//          Icon(CupertinoIcons.lightbulb_fill)
          _ColorSeedButton(
            handleColorSelect: handleColorSelect,
            colorSelected: colorSelected,
          ),
          const Expanded(child: VerticalDivider()),
        ],
      ),
    );
  }
}

class _ColorSeedButton extends StatelessWidget {
  const _ColorSeedButton({
    required this.handleColorSelect,
    required this.colorSelected,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        ColorSeed.values.length,
        (i) => SizedBox.square(
          dimension: mediaQueryData.size.height * 0.05,
          child: IconButton(
            iconSize: mediaQueryData.size.height * 0.0313,
            visualDensity: VisualDensity.compact,
            style: ButtonStyle(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.radio_button_unchecked),
            color: ColorSeed.values[i].color,
            isSelected: colorSelected.color == ColorSeed.values[i].color,
            selectedIcon: const Icon(Icons.circle),
            onPressed: () {
              handleColorSelect(i);
            },
            tooltip: ColorSeed.values[i].label,
          ),
        ),
      ),
    );
  }
}

class LightBulb extends StatelessWidget {
  const LightBulb({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primaryContainer;
    return ClipPath(
      clipper: ConeClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0, tileMode: TileMode.repeated),
        child: Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                color.withAlpha(10),
                color.withAlpha(70),
                color.withAlpha(170),
                color.withAlpha(150),
                color.withAlpha(120),
                color.withAlpha(100),
                color.withAlpha(40)
              ]
              //[
              //   Colors.white,
              //   const Color.fromARGB(100, 251, 193, 45),
              //   const Color.fromARGB(201, 255, 235, 59),
              //   const Color.fromARGB(53, 255, 249, 196),
              // ],
              //   stops: [0.1, 0.5, 0.7, 1.0],
              ,
              stops: [0.1, 0.2, 0.4, 0.6, 0.7, 0.8, 1.0],
              focal: Alignment.topCenter,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white30,
            ),
          ),
        ),
      ),
    );
  }
}

class ConeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width * 1;
    final double height = size.height;

    // Define the rounded edges
    final double roundedEdge = 2.0;

    /// Move to the starting point (top center)
    path.moveTo(width / 2, 0);

    // Draw the left side with a rounded edge
    path.lineTo(roundedEdge, height - roundedEdge);
    path.quadraticBezierTo(0, height, roundedEdge, height);

    // Draw the bottom side with a rounded edge
    path.lineTo(width - roundedEdge, height);
    path.quadraticBezierTo(width, height, width - roundedEdge, height - roundedEdge);

    // Draw the right side
    path.lineTo(width / 2, 0);

    // Close the path
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
