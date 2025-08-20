import 'dart:ui';

import 'package:flutter/material.dart';

import '../../const.dart';
import '../../util/buttons/buttons.dart';
import '../about/about.dart';
import '../contact/contact.dart';
import '../home/pages/home.dart';
import '../work/work.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(70);
  @override
  final Size preferredSize;

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
      fontVariations: <FontVariation>[FontVariation('wght', 600)]);
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
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha(value ? 75 : 0),
                // color: value ? const Color.fromRGBO(27, 25, 27, 0.4) : const Color.fromRGBO(27, 25, 27, 0.1),
                duration: Durations.medium1,
                height: value ? 120 : 0,
                alignment: Alignment.bottomCenter,
                //    padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const Expanded(
                      flex: 15,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/profile.png'),
                            ),
                            SizedBox(
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
                                        builder: (context) => const Work(),
                                      )),
                                  label: "Work",
                                ),

                                HoverButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const About(),
                                      )),
                                  label: "About",
                                ),
                                HoverButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Contact(),
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
