import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

extension ContextEx on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  TextStyle textStyle(String? fontFamily, double fontsize, double wght) => Layout.of(this)
      .value(xs: TextStyle(fontFamily: fontFamily, fontSize: fontsize, fontVariations: [FontVariation('wght', wght)]));
      TextStyle textStyl(String? fontFamily, double fontsize, double wght) => Layout.of(this)
      .value(xs: TextStyle(fontFamily: fontFamily, fontSize: fontsize, fontVariations: [FontVariation('wght', wght)]));
}
