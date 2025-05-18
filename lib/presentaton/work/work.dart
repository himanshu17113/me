import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:vector_graphics/vector_graphics.dart';
import '../../typo.dart';
import '../about/widget/tile.dart';
import '../widget/appbar.dart';
import 'component/experience.dart';
import 'component/tile.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  bool _isHovered = false;
  bool down = true;
  final ScrollController _scrollController = ScrollController();
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels > _lastOffset) {
      down = true;
      log("down");
    } else if (_scrollController.position.pixels < _lastOffset) {
      down = false;
      log("up");
    }
    _lastOffset = _scrollController.position.pixels;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: HomeAppBar(),
        body: ListView(
          controller: _scrollController,
          cacheExtent: 0,
          padding: EdgeInsets.only(right: screenWidth * 0.04),
          children: [
            SizedBox(
              height: mediaQueryData.size.width * 0.16,
              // width: mediaQueryData.size.width * 0.1,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: VectorGraphic(
                  loader: AssetBytesLoader(workStump),
                  alignment: Alignment.topRight,
                  colorFilter: ColorFilter.mode(_isHovered ? theme.colorScheme.primaryContainer : theme.colorScheme.inverseSurface, BlendMode.srcIn),
                  height: mediaQueryData.size.width * 0.16,
                  width: mediaQueryData.size.width * 0.2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: SizedBox(
                width: screenWidth * .8,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Work Experience",
                    maxLines: 1,
                    style: textStyle(fontSize: 82, fontFamily: "noe", wght: 1200.0),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.6,
              height: 8,
              indent: screenWidth * 0.04,
            ),
            ExperienceSection(
              time: "06/2024 - Present",
              delegation: "Flutter Developer",
              company: "Unanime Planet · Full-time",
              location: "Sede Aveiro, Portugal · Remote",
              description:
                  "As the lead developer for the Uprides mobile application, available on both Android and iOS, I managed the complete development lifecycle, from initial design to deployment and ongoing maintenance. Working closely with backend engineers, UI/UX designers, and product managers, I developed and integrated key features that enhanced user experience and performance.",
            ),
            ...{
              "Feature Development: ":
                  "Implemented complex real-time functionalities, including live map integration for ride tracking and advanced map animations to deliver a visually engaging user experience.",
              "Performance Optimization: ":
                  "Reduced application size and load time by optimizing assets, implementing efficient state management, and minimizing API calls.",
              "Localization & Accessibility: ":
                  "Developed responsive layouts and localization capabilities to ensure a seamless experience across diverse devices and regions.",
              "User Interaction: ":
                  "Streamlined user workflows, minimizing user inputs while maintaining functionality, and implemented intuitive navigation flows.",
              "Project Management: ":
                  "Utilized Jira for task management and Git for version control, ensuring smooth workflow coordination and efficient release cycles."
            }.entries.map((entry) => Tile(
                  title: entry.key,
                  description: entry.value,
                  down: down,
                )),
            ExperienceSection(
              time: "07/2023 - 06/2024",
              delegation: "Software Engineer",
              company: "Diago · Full-time",
              location: "Location not specified",
              description:
                  "Developed and maintained the Sbazar application available on the Play Store and App Store. Implemented complex animations for a smoother and more engaging user experience. Redesigned app architecture to enhance performance and maintainability. Utilized Jira for project management, tracking user stories, defects, and sprint details.",
            ),
            ...{
              "Sbazar App Development: ": "Developed and maintained the Sbazar application available on the Play Store and App Store.",
              "Animations & UX Improvements: ": "Implemented complex animations for a smoother and more engaging user experience.",
              "Architecture Redesign: ": "Redesigned app architecture to enhance performance and maintainability.",
              "Project Management: ": "Utilized Jira for project management, tracking user stories, defects, and sprint details.",
            }.entries.map((entry) => Tile(
                  title: entry.key,
                  description: entry.value,
                  down: down,
                )),
            ExperienceSection(
              time: "12/2022 - 07/2023",
              delegation: "Flutter Developer",
              company: "Hansraj Ventures · Full-time",
              location: "Remote",
              description:
                  "Designed, implemented, and tested the Music Book application using Dart and GETX for both iOS and Android. Built the E-magz application from scratch, integrating REST APIs, state management, and managing app and widget lifecycle. Collaborated with clients for requirement walkthroughs and reporting. Utilized AWS S3 for data storage and retrieval.",
            ),
            ...{
              "Music Book App Development: ":
                  "Designed, implemented, and tested the Music Book application using Dart and GETX for both iOS and Android platforms.",
              "E-magz App Development: ":
                  "Built the E-magz application from scratch, integrating REST APIs, state management, and managing app and widget lifecycle.",
              "Client Collaboration: ": "Collaborated with clients for requirement walkthroughs and reporting.",
              "Cloud Integration: ": "Utilized AWS S3 for data storage and retrieval.",
            }.entries.map((entry) => Tile(
                  title: entry.key,
                  description: entry.value,
                  down: down,
                )),
          ],
        ));
  }
}
