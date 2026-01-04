import 'package:flutter/material.dart'
    show kBottomNavigationBarHeight, kToolbarHeight;
import 'package:get/get.dart' show Get, GetNavigation;

final double bAppBar = kToolbarHeight + Get.mediaQuery.padding.top;
final double bNavBar =
    kBottomNavigationBarHeight + Get.mediaQuery.padding.bottom;
