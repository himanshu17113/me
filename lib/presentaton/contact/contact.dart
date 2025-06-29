import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:me/const.dart';
import 'package:me/typo.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../home/pages/home.dart';
import '../widget/appbar.dart';
import 'animated_text_field.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final _nameNode = FocusNode();
  final _jobNode = FocusNode();
  final _emailNode = FocusNode();
  final _messageNode = FocusNode();
  late final AnimationController _animationController;

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
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.long2,
    );
    animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _emailController.dispose();
    _messageController.dispose();

    _nameNode.dispose();
    _jobNode.dispose();
    _emailNode.dispose();
    _messageNode.dispose();
    super.dispose();
  }

  bool isHovered = false;

  late final CurvedAnimation animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQueryData.size.width * .06, vertical: mediaQueryData.size.width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("/Connect with me",
                style: textStyle(
                  fontSize: 52,
                  wght: 500,
                  fontFamily: "SourGummy",
                )),
            SizedBox(height: mediaQueryData.size.width * .02 + 40),
            Wrap(
              runSpacing: 36,
              spacing: 18,
              children: [
                Text("Hey, my name is",
                    style: textStyle(fontSize: 30, wght: 330, fontFamily: "SourGummy" // "Rubik",
                        )),
                AnimatedTextField(
                  hintText: "Your Name",
                  node: _nameNode,
                  textController: _nameController,
                  width: mediaQueryData.size.width * .2,
                ),
                Text("and I'm looking for",
                    style: textStyle(fontSize: 29, wght: 330, fontFamily: "SourGummy" //  "Rubik",
                        )),
                AnimatedTextField(
                  hintText: "Your Job Type",
                  node: _jobNode,
                  textController: _jobController,
                  width: mediaQueryData.size.width * .3,
                ),
                Text("•",
                    style: textStyle(fontSize: 29, wght: 330, fontFamily: "SourGummy" // "SourGummy",
                        )),
                Text("Get in touch with me at",
                    style: textStyle(fontSize: 29, wght: 330, fontFamily: "SourGummy" // "Rubik",
                        )),
                AnimatedTextField(
                  hintText: "Type your E-mail Here",
                  node: _emailNode,
                  textController: _emailController,
                  width: mediaQueryData.size.width * .3,
                ),
                Text("!",
                    style: textStyle(
                      fontSize: 29,
                      wght: 330,
                      fontFamily: "SourGummy",
                    )),
                Text("I have a special request and more information I’d like to share:",
                    style: textStyle(fontSize: 29, wght: 330, fontFamily: "SourGummy" // "Rubik",
                        )),
                AnimatedTextField(
                  hintText: "Tell Me MORE",
                  node: _messageNode,
                  textController: _messageController,
                  width: mediaQueryData.size.width * .6,
                ),
                Text("•",
                    style: textStyle(
                      fontSize: 29,
                      wght: 330,
                      fontFamily: "SourGummy",
                    )),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: MouseRegion(
                  onEnter: (PointerEnterEvent event) => _animationController.forward(),
                  onExit: (PointerExitEvent event) => _animationController.reverse(),
                  child: AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget? child) {
                        return SizedBox(
                          width: 200,
                          height: 42,
                          child: Stack(alignment: Alignment.centerLeft, children: [
                            Container(
                              width: 180 * animation.value + 42,
                              height: 42,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: ShapeDecoration(color: Colors.black, shape: StadiumBorder()),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10 * animation.value),
                                SizedBox(
                                  height: 14,
                                  width: 42,
                                  child: VectorGraphic(
                                    fit: BoxFit.fitHeight,
                                    loader: AssetBytesLoader(send),
                                    alignment: Alignment.center,
                                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 42),
                                  child: Text(
                                    "Send Message",
                                    style: textStyle(
                                      fontSize: 16,
                                      wght: 400,
                                      fontFamily: "SourGummy",
                                      color: Color.lerp(
                                        theme.colorScheme.inverseSurface,
                                        theme.colorScheme.onInverseSurface,
                                        animation.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
