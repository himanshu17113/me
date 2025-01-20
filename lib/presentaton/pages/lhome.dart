import 'package:flutter/material.dart';
import 'intro.dart';
import 'projects.dart';

class Lhome extends StatelessWidget {
  final ScrollController scrollController;
  const Lhome({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;

    return SizedBox(
      height: screenHeight,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: mediaQueryData.size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.secondaryContainer),
                    width: 120,
                    height: 120,
                  ),

                  // Container(
                  //   width: 60,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).colorScheme.secondaryContainer,
                  //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
                  //   ),
                  // ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(150),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                    ),
                  )
                ],
              ),
            ),
            Intro(),
            Projects()
          ],
        ),
      ),
    );
  }
}
