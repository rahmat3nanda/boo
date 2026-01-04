import 'dart:ui' show PathMetric, PathMetrics;

import 'package:boo/shared/ui/colors/color.dart'
    show BooColor, BooColorsBase, BooColorsToolBase, BoowColorToolBase;
import 'package:boo/shared/ui/styles/styles.dart' show GradientDirection;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        BoxBorder,
        BoxShape,
        Canvas,
        EdgeInsets,
        EdgeInsetsGeometry,
        LinearGradient,
        Paint,
        PaintingStyle,
        Path,
        RRect,
        Rect,
        ShapeBorder,
        TextDirection;

class BooUIGradientBoxBorder extends BoxBorder {
  const BooUIGradientBoxBorder({
    this.colors,
    this.direction = GradientDirection.bottomLeftToTopRight,
    this.width = 1.0,
    this.isDotted = false,
    this.dashLength = 5.0,
    this.dashSpacing = 3.0,
  });

  final BooColorsBase? colors;
  final GradientDirection direction;
  final double width;
  final bool isDotted;
  final double dashLength;
  final double dashSpacing;

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    switch (shape) {
      case BoxShape.circle:
        assert(
          borderRadius == null,
          'A borderRadius can only be given for rectangular boxes.',
        );
        isDotted
            ? _paintDottedCircle(canvas, rect)
            : _paintCircle(canvas, rect);
      case BoxShape.rectangle:
        if (borderRadius != null) {
          isDotted
              ? _paintDottedRRect(canvas, rect, borderRadius)
              : _paintRRect(canvas, rect, borderRadius);
        } else {
          isDotted ? _paintDottedRect(canvas, rect) : _paintRect(canvas, rect);
        }
    }
  }

  void _paintRect(Canvas canvas, Rect rect) {
    canvas.drawRect(rect.deflate(width / 2), _getPaint(rect));
  }

  void _paintRRect(Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final RRect rrect = borderRadius.toRRect(rect).deflate(width / 2);
    canvas.drawRRect(rrect, _getPaint(rect));
  }

  void _paintCircle(Canvas canvas, Rect rect) {
    final Paint paint = _getPaint(rect);
    final double radius = (rect.shortestSide - width) / 2.0;
    canvas.drawCircle(rect.center, radius, paint);
  }

  void _paintDottedRect(Canvas canvas, Rect rect) {
    final Paint paint = _getPaint(rect)..style = PaintingStyle.stroke;
    final Path path = Path()..addRect(rect.deflate(width / 2));
    _drawDashedPath(canvas, path, paint);
  }

  void _paintDottedRRect(Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final Paint paint = _getPaint(rect)..style = PaintingStyle.stroke;
    final RRect rrect = borderRadius.toRRect(rect).deflate(width / 2);
    final Path path = Path()..addRRect(rrect);
    _drawDashedPath(canvas, path, paint);
  }

  void _paintDottedCircle(Canvas canvas, Rect rect) {
    final Paint paint = _getPaint(rect)..style = PaintingStyle.stroke;
    final double radius = (rect.shortestSide - width) / 2.0;
    final Path path = Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: radius));
    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final PathMetrics metrics = path.computeMetrics();
    for (final PathMetric metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final double end = distance + dashLength;
        final Path extract = metric.extractPath(
          distance,
          end.clamp(0.0, metric.length),
        );
        canvas.drawPath(extract, paint);
        distance += dashLength + dashSpacing;
      }
    }
  }

  @override
  ShapeBorder scale(double t) => this;

  Paint _getPaint(Rect rect) => Paint()
    ..strokeWidth = width
    ..shader = LinearGradient(
      begin: direction.begin,
      end: direction.end,
      colors: colors?.values ?? BooColor.get.turquoise1.toColors().values,
    ).createShader(rect)
    ..style = PaintingStyle.stroke;
}
