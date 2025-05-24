import 'package:flutter/material.dart';
import 'package:me/presentaton/widget/about_project.dart';
import 'package:me/typo.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../const.dart';
import '../../widget/project_container.dart';

int visibily1 = 0;
int visibily2 = 0;
int visibily3 = 0;

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
            25;
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey(" projects"),
                    onVisibilityChanged: (info) {
                      if (visibily1 != (info.visibleFraction * 100).toInt()) setState(() => visibily1 = (info.visibleFraction * 100).toInt());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Durations.medium1,
                          width: visibily1 < 20
                              ? 0
                              : screenWidth > 1000
                                  ? screenWidth * .35
                                  : screenWidth * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.horizontal(right: Radius.circular(36))),
                          child: Text(
                            "My Projects",
                            maxLines: 1,
                            style: textStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontSize: 52,
                              fontFamily: "noe",
                              wght: 1200.0,
                            ),
                          ),
                        ),
                        ProjectContainer(
                          isVisble: visibily1 > 50,
                          lightColor: colorScheme.inversePrimary,
                          darkColor: colorScheme.secondaryFixed,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                      ],
                    ));
              },
            );
          }),
          Builder(builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey("projects2"),
                    onVisibilityChanged: (info) {
                      if (visibily2 != (info.visibleFraction * 100).toInt()) setState(() => visibily2 = (info.visibleFraction * 100).toInt());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutProject(
                          isVisble: visibily2 > 10,
                          label: "",
                          description: "",
                          onPressed: () {},
                          colorTypr: 0,
                        ),
                        ProjectContainer(
                          isVisble: visibily2 > 30,
                          lightColor: colorScheme.tertiaryContainer,
                          darkColor: colorScheme.tertiary,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                      ],
                    ));
              },
            );
          }),
          Builder(builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return VisibilityDetector(
                    key: const ValueKey("projects3"),
                    onVisibilityChanged: (info) {
                      if (visibily3 != (info.visibleFraction * 100).toInt()) setState(() => visibily3 = (info.visibleFraction * 100).toInt());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutProject(
                          isVisble: visibily3 > 10,
                          label: "",
                          description: "",
                          onPressed: () {},
                          colorTypr: 2,
                        ),
                        ProjectContainer(
                          isVisble: visibily3 > 45,
                          lightColor: colorScheme.secondaryContainer,
                          darkColor: colorScheme.secondary,
                          projectImage: 'assets/images/profile.png',
                          projectDetails: '',
                        ),
                        AboutProject(
                          isVisble: visibily3 > 80,
                          label: "",
                          description: "",
                          onPressed: () {},
                          colorTypr: 1,
                        ),
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
