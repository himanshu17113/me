import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Hom extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  bool isVisible = true;
  Hom() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isVisible) {
          isVisible = false;
          notifyListeners();
        }
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!isVisible) {
          isVisible = true;
          notifyListeners();
        }
      }
      // update([  "appbar"]);
    });
  }
}
