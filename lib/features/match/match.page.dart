import 'package:boo/cores/core/core.dart' show BooNavigation;
import 'package:boo/features/match/match.navigation.dart'
    show MatchNavigationDelegate;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIDev, BooUISvg;
import 'package:flutter/material.dart'
    show Center, GestureDetector, StatelessWidget, Widget;

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  static List<Widget> get leading => <Widget>[
    GestureDetector(
      onTap: () {},
      child: const BooUISvg(
        asset: 'assets/svg/flash.svg',
        width: 24,
        height: 24,
      ),
    ),
  ];

  static List<Widget> get trailing => <Widget>[
    GestureDetector(
      child: const BooUISvg(
        asset: 'assets/svg/translate.svg',
        width: 24,
        height: 24,
      ),
    ),
    GestureDetector(
      onTap: BooNavigation.i.delegate<MatchNavigationDelegate>().onFilter,
      child: const BooUISvg(
        asset: 'assets/svg/filter.svg',
        width: 24,
        height: 24,
      ),
    ),
  ];

  @override
  Widget build(_) => const Center(child: BooUIDev());
}
