import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformInfo {
  static bool isDesktopOS() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
  }

 static bool isAppOS() {
    return Platform.isIOS || Platform.isAndroid;
  }

 static bool isWeb() {
    return kIsWeb;
  }

 static PlatformType getCurrentPlatformType() {
    if (kIsWeb) {
      return PlatformType.Web;
    }

    if (Platform.isMacOS) {
      return PlatformType.MacOS;
    }

    if (Platform.isFuchsia) {
      return PlatformType.Fuchsia;
    }

    if (Platform.isLinux) {
      return PlatformType.Linux;
    }

    if (Platform.isWindows) {
      return PlatformType.Windows;
    }

    if (Platform.isIOS) {
      return PlatformType.iOS;
    }

    if (Platform.isAndroid) {
      return PlatformType.Android;
    }

    return PlatformType.Unknown;
  }
}

// ignore: constant_identifier_names
enum PlatformType { Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, Unknown }
