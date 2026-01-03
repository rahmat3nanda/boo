import 'package:flutter/material.dart' show Alignment;

enum GradientDirection {
  leftToRight(Alignment.centerLeft, Alignment.centerRight),
  rightToLeft(Alignment.centerRight, Alignment.centerLeft),
  topToDown(Alignment.topCenter, Alignment.bottomCenter),
  bottomToTop(Alignment.bottomCenter, Alignment.topCenter),
  bottomLeftToTopRight(Alignment.bottomLeft, Alignment.topRight),
  bottomRightToTopLeft(Alignment.bottomRight, Alignment.topLeft),
  topLeftToBottomRight(Alignment.topLeft, Alignment.bottomRight),
  topRightToBottomLeft(Alignment.topRight, Alignment.bottomLeft);

  const GradientDirection(this.begin, this.end);

  final Alignment begin;
  final Alignment end;
}
