import 'package:boo/shared/ui/colors/color.dart' show BooColor;
import 'package:flutter/material.dart'
    show Drawer, PreferredSizeWidget, Scaffold, StatelessWidget, Widget;

class BooScaffold extends StatelessWidget {
  const BooScaffold({
    this.body,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.bottomNavigationBar,
    this.drawer,
    this.background,
    super.key,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Widget? bottomNavigationBar;
  final Drawer? drawer;
  final Widget? background;

  @override
  Widget build(_) => Scaffold(
    key: key,
    backgroundColor: BooColor.get.scaffold.value,
    appBar: appBar,
    drawer: drawer,
    extendBodyBehindAppBar: extendBodyBehindAppBar,
    extendBody: extendBody,
    body: body,
    bottomNavigationBar: bottomNavigationBar,
  );
}
