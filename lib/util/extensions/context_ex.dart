import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isMobile => MediaQuery.of(this).size.width < 600;
    bool get isDesktop => MediaQuery.of(this).size.width < 600;
}
