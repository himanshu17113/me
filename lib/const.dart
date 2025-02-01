import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

late MediaQueryData mediaQueryData;
late double screenHeight;
late double screenWidth;
late ThemeData theme;

Text slash(BuildContext context) => Text(
      "  /  ",
      style: TextStyle(
          fontSize: context.layout.value(xs: 28, sm: 32, md: 36, lg: 48, xl: 60),
          fontFamily: "SourGummy",
          fontVariations: <FontVariation>[FontVariation('wght', 250.0)]),
    );
