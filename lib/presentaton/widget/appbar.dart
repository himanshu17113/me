import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:me/const.dart';
import 'package:me/presentaton/about/about.dart';
import 'package:me/presentaton/contact/contact.dart';

import 'package:me/presentaton/home/pages/home.dart';
import 'package:me/presentaton/work/work.dart';
import 'package:me/util/buttons/buttons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const HomeAppBar({
    super.key,

    //   required this.isVisible,
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
      fontSize: 16,
      letterSpacing: 0.1,
      fontFamily: "Rubik",
      fontVariations: <FontVariation>[FontVariation('wght', 600.0)]);
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
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha(value ? 75 : 0),
                // color: value ? const Color.fromRGBO(27, 25, 27, 0.4) : const Color.fromRGBO(27, 25, 27, 0.1),
                duration: Durations.medium1,
                height: value ? 120 : 0,
                alignment: Alignment.bottomCenter,
                //    padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 15,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('assets/images/profile.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Himanshu Singhal",
                              style: header,
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
                        visible: mediaQueryData.size.width > 750,
                        replacement: const EndDrawerButton(),
                        child: Expanded(
                            flex: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                HoverButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Work(),
                                      )),
                                  label: "Work",
                                ),

                                HoverButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => About(),
                                      )),
                                  label: "About",
                                ),
                                HoverButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Contact(),
                                      )),
                                  label: "Contact",
                                ),
                                // TextButton(onPressed: () {}, child: const Text("About", style: headerunder)),
                                // TextButton(
                                //     onPressed: () {},
                                //     child: const Text(
                                //       "Contact",
                                //       style: header,
                                //     )),
                              ],
                            ))),
                  ],
                )),
          ),
        ),
      );
}
