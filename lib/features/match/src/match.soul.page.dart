import 'dart:ui' show ImageFilter;

import 'package:boo/cores/core/core.dart' show BooUIController;
import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/styles/styles.dart' show GradientDirection;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooUIGradientBoxBorder, BooUISvg, BooUIText;
import 'package:boo/shared/utils/const.dart' show bNavBar;
import 'package:flutter/material.dart'
    show
        BackdropFilter,
        BorderRadius,
        BoxDecoration,
        BoxShape,
        ClipRRect,
        Container,
        EdgeInsets,
        GestureDetector,
        ListView,
        MainAxisAlignment,
        NeverScrollableScrollPhysics,
        Positioned,
        Row,
        Stack,
        StatelessWidget,
        Widget;
import 'package:get/get.dart' show GetBuilder;

part 'match.soul.controller.dart';

class MatchSoulPage extends StatelessWidget {
  const MatchSoulPage({super.key});

  @override
  Widget build(_) => GetBuilder<_MatchSoulController>(
    init: _MatchSoulController(),
    builder: (_MatchSoulController controller) => Stack(
      children: <Widget>[
        Positioned.fill(child: _mainView()),
        Positioned(
          bottom: bNavBar + 32,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 4,
            children: <Widget>[
              _button(icon: 'assets/svg/rocket.svg', size: 48),
              _button(icon: 'assets/svg/cross.svg', size: 64),
              _button(
                icon: 'assets/svg/like.svg',
                color: BooColor.get.rosePink,
                size: 48,
              ),
              _button(
                icon: 'assets/svg/like.svg',
                color: BooColor.get.turquoise1,
                size: 64,
              ),
              _button(icon: 'assets/svg/send.svg', size: 48),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _mainView() => ListView.builder(
    primary: false,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (_, _) => const BooUIText('asdasdasdasdasdasd'),
  );

  Widget _button({
    required String icon,
    required double size,
    BooColorBase? color,
  }) => GestureDetector(
    onTap: () {},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
        child: Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: BooUIGradientBoxBorder(
              width: 1.5,
              direction: GradientDirection.topToDown,
              colors: <BooColorBase>[
                BooColor.get.text,
                BooColor.get.text,
                BooColor.get.scaffold,
                BooColor.get.text,
                BooColor.get.text,
              ],
            ),
          ),
          child: BooUISvg(
            asset: icon,
            color: color,
            width: size - 12,
            height: size - 12,
          ),
        ),
      ),
    ),
  );
}
