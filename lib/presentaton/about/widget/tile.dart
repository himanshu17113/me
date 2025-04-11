import 'package:flutter/material.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../component/typer.dart';

class HorizontalLine extends StatefulWidget {
  final String title;
  final double size;
  const HorizontalLine({super.key, required this.title, this.size = 36});

  @override
  State<HorizontalLine> createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  bool visibily = false;
  bool show = true;
  late final int length;
  @override
  void initState() {
    length = widget.title.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.title),
      onVisibilityChanged: (info) {
        if (mounted) {
          if (visibily != (info.visibleFraction > .001)) {
            setState(
              () {
                debugPrint("set sttate");
                visibily = (info.visibleFraction > .001);
                if (!visibily) {
                  show = true;
                }
              },
            );
          }
        }
      },
      child: SizedBox(
        child: Row(
          children: [
            AnimatedContainer(
              duration: Durations.medium1,
              height: 2,
              color: Colors.black,
              width: visibily ? (screenWidth * widget.size * 0.001 + 10) : 1,
            ),
            SizedBox(
              width: length * 22,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  TypeText(
                    visibily ? " ${widget.title}" : "",
                    typingSpeed: 10,
                    style: textStyle(fontFamily: "noe", fontSize: widget.size),
                    delayBeforeStart: Duration(milliseconds: length * 100 + 250),
                  ),
                  Align(
                    alignment: show ? Alignment.centerLeft : Alignment.centerRight,
                    child: AnimatedContainer(
                      height: 20,
                      onEnd: () => show
                          ? setState(
                              () => show = false,
                            )
                          : null,
                      duration: Duration(milliseconds: length * 100),
                      color: Colors.black,
                      curve: Curves.easeInCubic,
                      width: show && visibily ? length * 22 : 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
