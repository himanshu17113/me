import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me/presentaton/widget/color_line.dart';
import 'package:me/const.dart';
import 'package:me/presentaton/pages/lhome.dart';

import '../widget/appbar.dart';
import '../../constants.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key,
      required this.useLightMode,
      required this.colorSelected,
      required this.handleBrightnessChange,
      required this.handleColorSelect});
  final bool useLightMode;
  final ColorSeed colorSelected;
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(int value) handleColorSelect;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  // ValueListenable<bool>
  final ValueNotifier<bool> isVisible = ValueNotifier(true);
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        key: key,
        extendBody: true,
        extendBodyBehindAppBar: true,

        ///   background// color: const Color.fromRGBO(27, 25, 27, 1),
        appBar: HomeAppBar(
          isVisible: isVisible,
          skey: key,
        ),
        endDrawer: const Drawer(
          //  background// color: Color.fromRGBO(241, 241, 241, 1),
          width: 10000,
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Himanshu Singhal"),
                    CloseButton(),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Lhome(scrollController: scrollController),
                ColorLine(
                    colorSelected: widget.colorSelected,
                    handleBrightnessChange: widget.handleBrightnessChange,
                    handleColorSelect: widget.handleColorSelect)
              ],
            ),
          ],
        ));
  }
}
