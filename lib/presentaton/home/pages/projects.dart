import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:me/presentaton/widget/about_project.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../const.dart';
import '../../widget/project_container.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: (context) {
            int visibily = 0;
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey(" projects"),
                    onVisibilityChanged: (info) {
                      log("visibility1: $visibily");
                      if (visibily != (info.visibleFraction * 100).toInt()) {
                        setState(() {
                          visibily = (info.visibleFraction * 100).toInt();
                        });
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Durations.medium1,
                          width: visibily < 20
                              ? 0
                              : screenWidth > 1000
                                  ? screenWidth * .35
                                  : screenWidth * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(36))),
                          child: Text(
                            "My Projects",
                            maxLines: 1,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontSize: context.layout.value(xs: 26, sm: 34, md: 48, lg: 52, xl: 58),
                              fontFamily: "noe",
                              fontWeight: FontWeight.bold,
                              fontVariations: <FontVariation>[FontVariation('wght', 1200.0)],
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        ProjectContainer(
                          isVisble: visibily > 50,
                          lightColor: Theme.of(context).colorScheme.inversePrimary,
                          darkColor: Theme.of(context).colorScheme.secondaryFixed,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                      ],
                    ));
              },
            );
          }),
          Builder(builder: (context) {
            int visibily = 0;
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey("projects2"),
                    onVisibilityChanged: (info) {
                      if (visibily != (info.visibleFraction * 100).toInt()) {
                        setState(() {
                          visibily = (info.visibleFraction * 100).toInt();
                        });
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutProject(isVisble: visibily > 10, label: "", description: "", onPressed: () {}),
                        ProjectContainer(
                          isVisble: visibily > 30,
                          lightColor: Theme.of(context).colorScheme.tertiaryContainer,
                          darkColor: Theme.of(context).colorScheme.tertiary,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                      ],
                    ));
              },
            );
          }),
          Builder(builder: (context) {
            int visibily = 0;
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey("projects3"),
                    onVisibilityChanged: (info) {
                      if (visibily != (info.visibleFraction * 100).toInt()) {
                        setState(() {
                          visibily = (info.visibleFraction * 100).toInt();
                        });
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutProject(isVisble: visibily > 10, label: "", description: "", onPressed: () {}),
                        ProjectContainer(
                          isVisble: visibily > 45,
                          lightColor: Theme.of(context).colorScheme.secondaryContainer,
                          darkColor: Theme.of(context).colorScheme.secondary,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                        AboutProject(isVisble: visibily > 80, label: "", description: "", onPressed: () {}),
                      ],
                    ));
              },
            );
          })
        ],
      ),
    );
  }
}
