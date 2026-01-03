import 'package:boo/shared/ui/colors/color.dart'
    show BooColorsBase, BooColorsToolBase;
import 'package:boo/shared/ui/styles/styles.dart' show GradientDirection;
import 'package:flutter/material.dart'
    show LinearGradient, Rect, ShaderMask, Widget;

extension WidgetShader on Widget {
  Widget gradient(
    BooColorsBase colors, {
    GradientDirection direction = GradientDirection.bottomLeftToTopRight,
  }) => ShaderMask(
    shaderCallback: (Rect bounds) => LinearGradient(
      begin: direction.begin,
      end: direction.end,
      colors: colors.values,
    ).createShader(bounds),
    child: this,
  );
}
