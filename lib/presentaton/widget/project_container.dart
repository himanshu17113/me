import 'package:flutter/material.dart';
import 'package:me/util/extensions/extensions.dart';

import '../../const.dart';
import '../../main.dart';

class ProjectContainer extends StatelessWidget {
  final bool isVisble;
  final Color lightColor;
  final Color darkColor;
  final bool isReversed;
  final String projectImage;
  final String projectDetails;
  const ProjectContainer(
      {super.key,
      this.isVisble = false,
      required this.lightColor,
      required this.darkColor,
      this.isReversed = false,
      required this.projectImage,
      required this.projectDetails});

  @override
  Widget build(BuildContext context) {
    final projectImage = Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: themeMode == ThemeMode.dark
              ? null
              : RadialGradient(
                  colors: [
                    lightColor.withAlpha(135), // Mid color
                    lightColor.withAlpha(160), // Mid color
                    lightColor.withAlpha(190), // Mid color
                    lightColor.withAlpha(225),
                    lightColor, // Outer color
                  ],
                  stops: [0.2, 0.4, 0.6, 0.8, 1.0], // Control the gradient spread
                ),
          color: darkColor,
          borderRadius: BorderRadius.circular(36),
        ),
      ),
    );
    final aboutProject = Expanded(
      child: Container(
        margin: EdgeInsets.all(screenWidth * .02),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Text("jhgfskdlghghsgdhjgjhghjdfghjghjfgshdghjsfghfsghdsghjdgfghgdgfhgsdfghfgfghjdghjdghgdfjh"),
      ),
    );
    final widgets = isReversed
        ? [
            aboutProject,
            projectImage,
          ]
        : [
            projectImage,
            aboutProject,
          ];
    return AnimatedContainer(
      duration: Durations.extralong4,
      height: 400,
      curve: Curves.easeInOut,
      width: !isVisble ? 0 : screenWidth,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(screenHeight * (context.isMobile ? .02 : .04), screenHeight * 0.06,
          context.isMobile ? 50 : screenWidth * 0.04, screenHeight * 0.06),
      padding: EdgeInsets.all(!isVisble ? 0 : screenWidth * .012),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withAlpha(40),
              spreadRadius: 2,
              blurRadius: 18,
              offset: const Offset(5, 5),
            ),
          ],
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: !context.isMobile
            ? Row(children: widgets)
            : Column(
                children: widgets,
              ),
      ),
    );
  }
}
