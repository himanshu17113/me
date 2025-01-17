import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:me/const.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueListenable<bool> isVisible;
  final GlobalKey<ScaffoldState> skey;
  @override
  final Size preferredSize;
  const HomeAppBar({
    super.key,
    required this.isVisible,
    required this.skey,
  }) : preferredSize = const Size.fromHeight(70.0);

  static const headeritalic = TextStyle(
      // color: Colors.white,
      fontStyle: FontStyle.italic,
      fontSize: 16,
      letterSpacing: 0.44,
      wordSpacing: 0.6

      //fontFamily:
      );
  static const header = TextStyle(
    // color: Colors.white,
    fontSize: 18,
    letterSpacing: 1,
    //fontFamily:
  );
  static const headerunder = TextStyle(
    // color: Colors.white,
    decoration: TextDecoration.underline,
    decorationThickness: 1.6,
    //  decoration// color: Colors.white,

    fontSize: 18,
    letterSpacing: 1,
    //  fontWeight: FontWeight.w500,
    //fontFamily:
  );

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: isVisible,
        builder: (BuildContext context, dynamic value, Widget? child) => ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: AnimatedContainer(
                // color: value ? const Color.fromRGBO(27, 25, 27, 0.4) : const Color.fromRGBO(27, 25, 27, 0.1),
                duration: const Duration(milliseconds: 200),
                height: value ? 70 : 0,
                //    padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Text(
                              "Himanshu Singhal",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              '. Mobile Developer',
                              style: headeritalic,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Visibility(
                        visible: mediaQueryData.size.width > 1000,
                        replacement: const EndDrawerButton(),
                        child: Expanded(
                            flex: 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Projects",
                                      style: header,
                                    )),
                                TextButton(onPressed: () {}, child: const Text("About", style: headerunder)),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Contact",
                                      style: header,
                                    )),
                              ],
                            ))),
                    const Spacer()
                  ],
                )),
          ),
        ),
      );
}
