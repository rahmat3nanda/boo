import 'package:boo/shared/ui/colors/color.dart' show BooColorBase;
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BoxShape,
        ClipOval,
        ClipRRect,
        Container,
        Image,
        SizedBox,
        StatelessWidget,
        Widget;

class BooUIImage extends StatelessWidget {
  const BooUIImage({
    this.asset,
    this.network,
    this.shape = BoxShape.rectangle,
    this.borderRadius = BorderRadius.zero,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.placeholder,
    this.backgroundColor,
    super.key,
  });

  final String? asset;
  final String? network;
  final BoxShape shape;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final BooColorBase? backgroundColor;

  @override
  Widget build(_) => Container(
    height: height,
    width: width,
    decoration: BoxDecoration(shape: shape, color: backgroundColor?.value),
    child: shape == BoxShape.circle
        ? ClipOval(child: _content())
        : ClipRRect(borderRadius: borderRadius, child: _content()),
  );

  Widget _content() {
    if (asset != null && asset!.isNotEmpty) {
      return Image.asset(
        asset!,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, _, _) => placeholder ?? const SizedBox.shrink(),
      );
    }

    if (network != null && network!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: network!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (_, _) => placeholder ?? const SizedBox.shrink(),
        errorWidget: (_, _, _) => placeholder ?? const SizedBox.shrink(),
      );
    }

    return placeholder ?? const SizedBox.shrink();
  }
}
