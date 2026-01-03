import 'package:boo/cores/core/core.dart' show BooNavigation, BooUIController;
import 'package:boo/features/match/match.navigation.dart'
    show MatchNavigationDelegate;
import 'package:boo/features/match/src/power_up.sheet.dart' show PowerUpSheet;
import 'package:boo/shared/ui/colors/color.dart' show BooColor;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooScaffold, BooUISvg;
import 'package:flutter/material.dart'
    show GestureDetector, StatelessWidget, Widget;
import 'package:get/get.dart' show GetBuilder;

part 'match.controller.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  static List<Widget> get leading => <Widget>[
    GestureDetector(
      onTap: PowerUpSheet.show,
      child: const BooUISvg(
        asset: 'assets/svg/flash.svg',
        width: 24,
        height: 24,
      ),
    ),
  ];

  static List<Widget> get trailing => <Widget>[
    GestureDetector(
      onTap: BooNavigation.i.delegate<MatchNavigationDelegate>().onTranslate,
      child: BooUISvg(
        asset: 'assets/svg/translate.svg',
        width: 24,
        height: 24,
        color: BooColor.get.text,
      ),
    ),
    GestureDetector(
      onTap: BooNavigation.i.delegate<MatchNavigationDelegate>().onFilter,
      child: BooUISvg(
        asset: 'assets/svg/filter.svg',
        width: 24,
        height: 24,
        color: BooColor.get.text,
      ),
    ),
  ];

  @override
  Widget build(_) => GetBuilder<_MatchController>(
    init: _MatchController(),
    builder: (_MatchController controller) => BooScaffold(),
  );
}
