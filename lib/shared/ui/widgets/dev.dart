import 'package:boo/shared/ui/widgets/widgets.dart' show BooUIAnim, BooUIText;
import 'package:flutter/material.dart'
    show Column, FontWeight, MainAxisSize, StatelessWidget, TextAlign, Widget;

class BooUIDev extends StatelessWidget {
  const BooUIDev({super.key});

  @override
  Widget build(_) => const Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 24,
    children: <Widget>[
      BooUIAnim(asset: 'assets/anim/development.json', width: 320),
      BooUIText(
        'Page under development',
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ],
  );
}
