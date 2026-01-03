import 'package:boo/shared/ui/widgets/sliver_center.dart' show SliverCenter;
import 'package:flutter/material.dart'
    show
        SliverAppBar,
        SliverFillRemaining,
        SliverFillViewport,
        SliverFixedExtentList,
        SliverGrid,
        SliverLayoutBuilder,
        SliverList,
        SliverPadding,
        SliverToBoxAdapter,
        Widget;

extension WidgetSliver on Widget {
  bool get isSliver =>
      this is SliverList ||
      this is SliverGrid ||
      this is SliverToBoxAdapter ||
      this is SliverPadding ||
      this is SliverAppBar ||
      this is SliverFixedExtentList ||
      this is SliverLayoutBuilder ||
      this is SliverFillRemaining ||
      this is SliverFillViewport ||
      this is SliverCenter;
}
