import 'package:flutter/material.dart';

import 'util/responsive.dart';

const TextStyle displayLarge = TextStyle(
    debugLabel: 'englishLike displayLarge 2021',
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle displayMedium = TextStyle(
    debugLabel: 'englishLike displayMedium 2021',
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.16,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle displaySmall = TextStyle(
    debugLabel: 'englishLike displaySmall 2021',
    fontSize: 36.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.22,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle headlineLarge = TextStyle(
    debugLabel: 'englishLike headlineLarge 2021',
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.25,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle headlineMedium = TextStyle(
    debugLabel: 'englishLike headlineMedium 2021',
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.29,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle headlineSmall = TextStyle(
    debugLabel: 'englishLike headlineSmall 2021',
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle titleLarge = TextStyle(
    debugLabel: 'englishLike titleLarge 2021',
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.27,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle titleBig = TextStyle(
    debugLabel: 'englishLike titleLarge 2021',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.27,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle titleMedium = TextStyle(
    debugLabel: 'englishLike titleMedium 2021',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle titleSmall = TextStyle(
    debugLabel: 'englishLike titleSmall 2021',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle labelLarge = TextStyle(
    debugLabel: 'englishLike labelLarge 2021',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle labelMedium = TextStyle(
    debugLabel: 'englishLike labelMedium 2021',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle labelSmall = TextStyle(
    debugLabel: 'englishLike labelSmall 2021',
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle bodyLarge = TextStyle(
    debugLabel: 'englishLike bodyLarge 2021',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle bodyMedium = TextStyle(
    debugLabel: 'englishLike bodyMedium 2021',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);
const TextStyle bodySmall = TextStyle(
    debugLabel: 'englishLike bodySmall 2021',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even);

const TextStyle xs = TextStyle(fontSize: 16);
const TextStyle sm = TextStyle(fontSize: 24);
const TextStyle md = TextStyle(fontSize: 36);
const TextStyle lg = TextStyle(fontSize: 48);
const TextStyle xl = TextStyle(fontSize: 60);

TextStyle
    textStyle({double? wordSpacing, double? letterSpacing, String? fontFamily, required double fontSize, double wght = 400}) =>
        responsive(
            xs: TextStyle(
                fontFamily: fontFamily,
                wordSpacing: wordSpacing,
                fontSize: fontSize * 0.6666,
                letterSpacing: letterSpacing,
                fontVariations: [FontVariation('wght', wght)],
                textBaseline: TextBaseline.alphabetic,
                leadingDistribution: TextLeadingDistribution.even),
            sm: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize * 0.7777,
                fontVariations: [FontVariation('wght', wght)],
                textBaseline: TextBaseline.alphabetic,
                leadingDistribution: TextLeadingDistribution.even),
            md: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize * 0.8888,
                fontVariations: [FontVariation('wght', wght)],
                textBaseline: TextBaseline.alphabetic,
                leadingDistribution: TextLeadingDistribution.even),
            lg: TextStyle(
                inherit: false,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontVariations: [FontVariation('wght', wght)],
                textBaseline: TextBaseline.alphabetic,
                leadingDistribution: TextLeadingDistribution.even),
            xl: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize * 1.5,
                fontVariations: [FontVariation('wght', wght)],
                textBaseline: TextBaseline.alphabetic,
                leadingDistribution: TextLeadingDistribution.even));
