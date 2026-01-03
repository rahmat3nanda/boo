import 'package:boo/cores/core/core.dart' show BooNavigation;
import 'package:boo/features/message/message.navigation.dart'
    show MessageNavigationDelegate;
import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIDev, BooUISvg;
import 'package:flutter/material.dart'
    show Center, GestureDetector, StatelessWidget, Widget;

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  static List<Widget> get leading => const <Widget>[];

  static List<Widget> get trailing => <Widget>[
    GestureDetector(
      onTap: BooNavigation.i.delegate<MessageNavigationDelegate>().onCreateNew,
      child: const BooUISvg(asset: 'assets/svg/add.svg', width: 24, height: 24),
    ),
  ];

  @override
  Widget build(_) => const Center(child: BooUIDev());
}
