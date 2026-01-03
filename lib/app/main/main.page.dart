import 'dart:ui' show ImageFilter;

import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/app/main/main.menu.dart'
    show MainMenu, MainMenuIcon, MainMenuPage, MainMenuString;
import 'package:boo/shared/ui/colors/color.dart' show BooColor;
import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooScaffold, BooUISvg, BooUIText;
import 'package:flutter/material.dart'
    show
        BackdropFilter,
        ClipRRect,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        GestureDetector,
        MainAxisAlignment,
        MainAxisSize,
        Padding,
        PageView,
        Positioned,
        Row,
        SafeArea,
        Stack,
        StatelessWidget,
        Widget;
import 'package:get/get.dart' show GetBuilder, GetPage;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static GetPage<dynamic> get page =>
      GetPage<dynamic>(name: AppRoute.main.go, page: MainPage.new);

  @override
  Widget build(_) => GetBuilder<BooTheme>(
    builder: (_) => BooScaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: _mainView()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
                child: SafeArea(top: false, child: _menuView(onSelect: (_) {})),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _mainView() => PageView.builder(
    itemCount: MainMenu.values.length,
    itemBuilder: (_, int i) => MainMenu.values[i].page,
  );

  Widget _menuView({required Function(MainMenu menu) onSelect}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: MainMenu.values
          .map(
            (MainMenu e) => Expanded(
              child: GestureDetector(
                onTap: () => onSelect(e),
                child: Column(
                  spacing: 2,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    BooUISvg(
                      asset: e.icon,
                      width: 28,
                      height: 28,
                      color: BooColor.get.text,
                    ),
                    BooUIText(
                      e.title,
                      color: BooColor.get.text,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
