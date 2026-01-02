import 'dart:ui' show Color;

import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:boo/shared/ui/themes/theme_mode_enum.dart' show BooThemeMode;
import 'package:flutter/material.dart' show Alignment, Colors, LinearGradient;

part 'color.dark.dart';
part 'color.light.dart';
part 'color_base.dart';

abstract mixin class BooColor {
  const BooColor();

  BooColorBase get scaffold;

  BooColorBase get turquoise1 => const Color(0xFF34e5eb).base;

  static BooColor get get => BooTheme.i.mode.value == BooThemeMode.light
      ? const _BooLightColor()
      : const _BooDarkColor();
}
