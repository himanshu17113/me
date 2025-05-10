import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:visibility_detector/visibility_detector.dart';

final ValueNotifier<bool> isFooterVisiblex = ValueNotifier(false);

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFooterVisiblex,
      builder: (context, isFooterVisible, child) => VisibilityDetector(
        onVisibilityChanged: (info) {
          if (info.visibleFraction >= 0.5) {
            isFooterVisiblex.value = true;
            // bgColorx.value = true;
          } else {
            isFooterVisiblex.value = false;
          }
        },
        key: const ValueKey("footer"),
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: UpperStipes()),
              Expanded(flex: 4, child: LowerStripes()),
            ],
          ),
        ),
      ),
    );
  }
}

class LowerStripes extends StatelessWidget {
  const LowerStripes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          duration: Durations.extralong2,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .14,
        ),
        AnimatedContainer(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          duration: Durations.extralong3,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .27,
        ),
        AnimatedContainer(
          color: Theme.of(context).colorScheme.onPrimaryFixed,
          duration: Durations.extralong4,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .4,
        ),
      ],
    );
  }
}

class UpperStipes extends StatelessWidget {
  const UpperStipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          alignment: Alignment.topRight,
          color: Theme.of(context).colorScheme.primaryFixed,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          duration: Durations.medium2,
          width: isFooterVisiblex.value ? screenWidth : 10,
          height: screenHeight * .15,
        ),
        AnimatedContainer(
          color: Theme.of(context).colorScheme.primaryFixed,
          duration: Durations.medium4,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .3,
        ),
        AnimatedContainer(
          color: Theme.of(context).colorScheme.primaryFixed,
          duration: Durations.long2,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .45,
        ),
        AnimatedContainer(
          color: Theme.of(context).colorScheme.primaryFixed,
          duration: Durations.long4,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: isFooterVisiblex.value ? screenWidth : 0,
          height: screenHeight * .6,
        ),
      ],
    );
  }
}
