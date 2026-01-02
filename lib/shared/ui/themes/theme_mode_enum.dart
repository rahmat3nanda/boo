import 'dart:io' show Platform;
import 'dart:ui' show Brightness;

import 'package:boo/shared/ui/extensions/system_overlay.dart'
    show BooSystemOverlay;

enum BooThemeMode {
  light,
  dark;

  factory BooThemeMode.from(Brightness brightness) =>
      brightness == Brightness.dark ? dark : light;
}

extension BooThemeModeTools on BooThemeMode {
  BooThemeMode get toggle => switch (this) {
    BooThemeMode.light => BooThemeMode.dark,
    BooThemeMode.dark => BooThemeMode.light,
  };

  BooSystemOverlay get overlay => switch (this) {
    BooThemeMode.dark =>
      Platform.isIOS ? BooSystemOverlay.dark : BooSystemOverlay.light,
    BooThemeMode.light =>
      Platform.isIOS ? BooSystemOverlay.light : BooSystemOverlay.dark,
  };

  Brightness get brightness => switch (this) {
    BooThemeMode.dark => Brightness.dark,
    BooThemeMode.light => Brightness.light,
  };
}
