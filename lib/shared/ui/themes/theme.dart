import 'dart:ui' show Brightness;

import 'package:boo/cores/core/core.dart' show BooUIController;
import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/extensions/system_overlay.dart'
    show BooSystemOverlay, BooSystemOverlayBrightness;
import 'package:boo/shared/ui/themes/theme_mode_enum.dart'
    show BooThemeMode, BooThemeModeTools;
import 'package:flutter/material.dart'
    show AnnotatedRegion, Colors, Widget, WidgetsBinding;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:get/get.dart' show Get, Inst, Rx, RxDouble;

class BooTheme extends BooUIController {
  final Rx<BooThemeMode> _mode = Rx<BooThemeMode>(BooThemeMode.light);
  final RxDouble textScaleFactor = RxDouble(1);

  Rx<BooThemeMode> get mode => _mode;

  BooColor get color => BooColor.get;

  static BooTheme get i => Get.find<BooTheme>();

  static void initialize({BooThemeMode? mode}) {
    final BooTheme theme = Get.put<BooTheme>(BooTheme());
    final Brightness osMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    theme._mode.value = mode ?? BooThemeMode.from(osMode);
  }

  void toggle() {
    _mode.value = _mode.value.toggle;
    update();
  }

  void change(BooThemeMode mode) {
    _mode.value = mode;
    update();
  }

  static Widget systemOverlay({
    required BooSystemOverlay overlay,
    required Widget child,
    BooColorBase? statusBarColor,
    BooColorBase? navigationColor,
  }) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      statusBarColor: statusBarColor?.value ?? Colors.transparent,
      statusBarIconBrightness: overlay.iconBrightness,
      statusBarBrightness: overlay.brightness,
      systemNavigationBarColor: navigationColor?.value ?? Colors.transparent,
      systemNavigationBarDividerColor:
          navigationColor?.value ?? Colors.transparent,
      systemNavigationBarIconBrightness: overlay.iconBrightness,
    ),
    child: child,
  );
}
