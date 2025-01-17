import 'package:flutter/material.dart';
import 'package:me/constants.dart';
import 'package:me/home.dart';
import 'const.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.system;
  ColorSeed colorSelected = ColorSeed.white;

  bool get useLightMode => switch (themeMode) {
        ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false
      };

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = ColorSeed.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      //  //   initialRoute: Routes.home,
      //     routes: Routes.routes,

      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      themeMode: themeMode,
      theme: ThemeData(
          colorSchemeSeed: colorSelected.color,
          useMaterial3: true,
          brightness: Brightness.light,
          textTheme: TextTheme()),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      highContrastDarkTheme:
          ThemeData.from(colorScheme: ColorScheme.highContrastDark(brightness: Brightness.dark), useMaterial3: true),
      highContrastTheme:
          ThemeData.from(colorScheme: ColorScheme.highContrastLight(brightness: Brightness.light), useMaterial3: true),
      home: Home(
        useLightMode: useLightMode,
        colorSelected: colorSelected,
        handleBrightnessChange: handleBrightnessChange,
        handleColorSelect: handleColorSelect,
      ),
    );
  }
}
