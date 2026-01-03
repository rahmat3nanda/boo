import 'package:boo/shared/utils/extensions/string.compare.dart'
    show StringCompare;
import 'package:flutter/material.dart'
    show Alignment, BoxFit, SizedBox, StatelessWidget, Widget;
import 'package:lottie/lottie.dart' show Lottie;

class BooUIAnim extends StatelessWidget {
  const BooUIAnim({
    this.asset,
    this.network,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    super.key,
  });

  final String? asset;
  final String? network;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Alignment alignment;

  @override
  Widget build(_) {
    if (asset.isNotEmptyAndNotNull) {
      return Lottie.asset(
        asset!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    }
    if (network.isNotEmptyAndNotNull) {
      return Lottie.network(
        network!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );
    }
    return const SizedBox.shrink();
  }
}
