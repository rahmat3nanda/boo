import 'package:flutter/material.dart'
    show AppBar, PreferredSizeWidget, Size, SizedBox, StatelessWidget, Widget;
import 'package:get/get.dart' show Get, GetNavigation;

class BooUIAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BooUIAppBar({this.child = const SizedBox.shrink(), super.key});

  final Widget child;

  @override
  Widget build(_) => AppBar();

  @override
  Size get preferredSize => Size.fromHeight(Get.mediaQuery.padding.top);
}
