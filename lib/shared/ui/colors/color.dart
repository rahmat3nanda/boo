import 'dart:ui' show Color;

import 'package:flutter/material.dart' show Alignment, Colors, LinearGradient;

part 'color.light.dart';
part 'color_base.dart';

abstract mixin class BooColor {
  BooColorBase get scaffold;

  static BooColor get get => _BooLightColor();
}
