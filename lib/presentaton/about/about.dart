import 'package:flutter/material.dart';
import 'package:me/const.dart';
 
import 'sub/backgound.dart';
import 'sub/intro.dart';
import 'sub/jouney.dart';
import 'sub/tools.dart';
import 'sub/wiltd.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
    return ListView(
      cacheExtent: 0,
      children: const [Intro(), Backgound(), Journey(), WhatILoveToDo(), Tools()],
    );
  }
}
