import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me/const.dart';
import '../home/pages/home.dart';
import '../widget/appbar.dart';
import 'sub/backgound.dart';
import 'sub/intro.dart';
import 'sub/jouney.dart';
import 'sub/tools.dart';
import 'sub/wiltd.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isVisible.value) {
          isVisible.value = false;
        }
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!isVisible.value) {
          isVisible.value = true;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const HomeAppBar(),
        body: ListView(
          controller: scrollController,
          cacheExtent: 0,
          children: const [Intro(), Backgound(), Journey(), WhatILoveToDo(), Tools()],
        ));
  }
}
