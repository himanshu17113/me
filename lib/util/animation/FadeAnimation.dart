import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Create your Animation Example
enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // Simple staggered tween
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0), duration: Duration(milliseconds: 500), curve: Curves.easeIn)
      ..tween('translateY', Tween(begin: -30.0, end: 0.0), duration: Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: (value as Map)["opacity"],
        child: Transform.translate(offset: Offset(0, (value as Map)["translateY"]), child: child),
      ),
    );
  }
}
