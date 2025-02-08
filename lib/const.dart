import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

late MediaQueryData mediaQueryData;
late double screenHeight;
late double screenWidth;
late ThemeData theme;
late ColorScheme colorScheme;

Text slash(BuildContext context) => Text(
      "  /  ",
      style: TextStyle(
          fontSize: context.layout.value(xs: 28, sm: 32, md: 36, lg: 48, xl: 60),
          fontFamily: "SourGummy",
          fontVariations: <FontVariation>[FontVariation('wght', 250.0)]),
    );
// SVG Asset Strings
String androidStudio = "assets/images/svg/android-studio.svg";
String android = "assets/images/svg/android.svg";
String api = "assets/images/svg/api.svg";
String appStore = "assets/images/svg/app-store.svg";
String bitbucket = "assets/images/svg/bitbucket.svg";
String dart = "assets/images/svg/dart.svg";
String figma = "assets/images/svg/figma.svg";
String firebase = "assets/images/svg/firebase.svg";
String git = "assets/images/svg/git.svg";
String github = "assets/images/svg/github.svg";
String googleMap = "assets/images/svg/google-map.svg";
String googlePay = "assets/images/svg/google-pay.svg";
String graphql = "assets/images/svg/graphql.svg";
String hive = "assets/images/svg/hive.svg";
String iap = "assets/images/svg/iap.svg";
String injectable = "assets/images/svg/injectable.svg";
String ios = "assets/images/svg/ios.svg";
String javascript = "assets/images/svg/javascript.svg";
String jira = "assets/images/svg/jira.svg";
String json = "assets/images/svg/json.svg";
String kotlin = "assets/images/svg/kotlin.svg";
String postmanIcon = "assets/images/svg/postman-icon.svg";
String provider = "assets/images/svg/provider.svg";
String riverpod = "assets/images/svg/riverpod.svg";
String slack = "assets/images/svg/slack.svg";
String sqlite = "assets/images/svg/sqlite.svg";
String stripe = "assets/images/svg/stripe.svg";
String visualStudioCode = "assets/images/svg/visual-studio-code.svg";
String xcode = "assets/images/svg/xcode.svg";

final List<String> tools = [
  "assets/images/svg/android-studio.svg",
  "assets/images/svg/android.svg",
  "assets/images/svg/api.svg",
  "assets/images/svg/app-store.svg",
  "assets/images/svg/bitbucket.svg",
  "assets/images/svg/bloc.svg",
  "assets/images/svg/dart.svg",
  "assets/images/svg/figma.svg",
  "assets/images/svg/firebase.svg",
  "assets/images/svg/getx.svg",
  "assets/images/svg/git.svg",
  "assets/images/svg/github.svg",
  "assets/images/svg/google-map.svg",
  "assets/images/svg/google-play.svg",
  "assets/images/svg/google-pay.svg",
  "assets/images/svg/graphql.svg",
  "assets/images/svg/hive.svg",
  "assets/images/svg/iap.svg",
  "assets/images/svg/injectable.svg",
  "assets/images/svg/ios.svg",
  "assets/images/svg/javascript.svg",
  "assets/images/svg/jira.svg",
  "assets/images/svg/json.svg",
  "assets/images/svg/kotlin.svg",
  "assets/images/svg/postman-icon.svg",
  "assets/images/svg/provider.svg",
  "assets/images/svg/riverpod.svg",
  "assets/images/svg/slack.svg",
  "assets/images/svg/sqlite.svg",
  "assets/images/svg/stripe.svg",
  "assets/images/svg/visual-studio-code.svg",
  "assets/images/svg/xcode.svg",
];
