import 'package:boo/shared/ui/colors/color.dart'
    show BooColorBase, BooColorsBase;
import 'package:boo/shared/ui/extensions/widget.shader.dart' show WidgetShader;
import 'package:boo/shared/ui/styles/styles.dart' show GradientDirection;
import 'package:boo/shared/utils/extensions/string.compare.dart'
    show StringCompare;
import 'package:flutter/material.dart'
    show
        Alignment,
        BlendMode,
        BoxFit,
        ColorFilter,
        Colors,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class BooUISvg extends StatelessWidget {
  const BooUISvg({
    this.asset,
    this.network,
    this.color,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.gradientColor,
    this.gradientDirection,
    this.alignment = Alignment.center,
    this.placeholder,
    super.key,
  });

  final String? asset;
  final String? network;
  final BooColorBase? color;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BooColorsBase? gradientColor;
  final GradientDirection? gradientDirection;
  final Alignment alignment;
  final Widget? placeholder;

  @override
  Widget build(_) {
    if (asset.isEmptyOrNull && network.isEmptyOrNull) {
      return const SizedBox.shrink();
    }

    final bool hasGradient = gradientColor != null && gradientColor!.length > 1;
    ColorFilter? colorFilter;
    if (hasGradient) {
      colorFilter = const ColorFilter.mode(Colors.white, BlendMode.srcIn);
    } else {
      if (color != null) {
        colorFilter = ColorFilter.mode(color!.value, BlendMode.srcIn);
      }
    }

    SvgPicture? svg;
    if (asset.isNotEmptyAndNotNull) {
      svg = SvgPicture.asset(
        asset!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: colorFilter,
      );
    } else if (network.isNotEmptyAndNotNull) {
      svg = SvgPicture.network(
        network!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: colorFilter,
        placeholderBuilder: (_) => placeholder ?? const SizedBox.shrink(),
      );
    }

    if (svg == null) {
      return const SizedBox.shrink();
    }

    if (hasGradient) {
      return svg.gradient(
        gradientColor!,
        direction: gradientDirection ?? GradientDirection.bottomLeftToTopRight,
      );
    }

    return svg;
  }
}
