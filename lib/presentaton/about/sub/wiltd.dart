import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../typo.dart';
import '../../../util/extensions/extensions.dart';
import '../widget/hobby_items.dart';

class WhatILoveToDo extends StatelessWidget {
  const WhatILoveToDo({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        //  height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.06, right: screenWidth * (context.isDesktop ? 0.1 : 0.04)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text("What I Love To Do",
                    style: textStyle(
                      fontSize: 46,
                      wght: 500,
                      fontFamily: "SourGummy",
                    )),
              ),
              Wrap(
                spacing: 5 + mediaQueryData.size.width * 0.04,
                runSpacing: 10 + mediaQueryData.size.width * 0.05,
                children: const [
                  HobbyItem(icon: Icons.code, label: "Learning \nnew technology"),
                  HobbyItem(icon: Icons.music_note_outlined, label: "Song"),
                  HobbyItem(icon: Icons.coffee_maker_outlined, label: "Coffee"),
                  HobbyItem(icon: Icons.auto_stories, label: "Listening \nAudio Book"),
                  HobbyItem(icon: Icons.local_movies, label: "Movies"),
                  HobbyItem(icon: Icons.explore_outlined, label: "Exploaring new \nscience discovery"),
                ],
              )
            ],
          ),
        ));
}
