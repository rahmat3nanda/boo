import 'dart:ui' show ImageFilter;

import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/cores/core/core.dart' show BooUIController;
import 'package:boo/features/message/message.page.dart' show MessagePage;
import 'package:boo/features/universe/universe.page.dart' show UniversePage;
import 'package:boo/shared/ui/colors/color.dart' show BooColor;
import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooScaffold, BooUIDev, BooUISvg, BooUIText;
import 'package:boo/shared/utils/const.dart' show bAppBar;
import 'package:flutter/material.dart'
    show
        Align,
        BackdropFilter,
        Center,
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
        PageController,
        PageView,
        Positioned,
        Row,
        SafeArea,
        SizedBox,
        Stack,
        StatelessWidget,
        Widget,
        kToolbarHeight;
import 'package:get/get.dart'
    show Get, GetBuilder, GetNavigation, GetPage, ObxValue, Rx;

part 'main.controller.dart';
part 'main.menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static GetPage<dynamic> get page =>
      GetPage<dynamic>(name: AppRoute.main.go, page: MainPage.new);

  @override
  Widget build(_) => GetBuilder<BooTheme>(
    builder: (_) => GetBuilder<_MainController>(
      init: _MainController(),
      builder: (_MainController controller) => BooScaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: _mainView(controller: controller.menuController),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
                  child: ObxValue<Rx<_MainMenu>>(
                    (Rx<_MainMenu> menu) => _appbar(
                      leading: <Widget>[
                        GestureDetector(
                          child: BooUISvg(
                            asset: 'assets/svg/drawer.svg',
                            width: 24,
                            height: 24,
                            color: BooColor.get.text,
                          ),
                        ),
                        ...menu.value.leading,
                      ],
                      trailing: menu.value.trailing,
                    ),
                    controller.menu,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
                  child: SafeArea(
                    top: false,
                    child: ObxValue<Rx<_MainMenu>>(
                      (Rx<_MainMenu> selected) => _menuView(
                        selected: selected.value,
                        onSelect: controller.onMenuSelected,
                      ),
                      controller.menu,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _appbar({
    List<Widget> leading = const <Widget>[],
    List<Widget> trailing = const <Widget>[],
  }) => SizedBox(
    height: bAppBar,
    child: Column(
      children: <Widget>[
        const SizedBox(height: kToolbarHeight),
        Stack(
          children: <Widget>[
            Positioned(
              top: 4,
              bottom: 4,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: <Widget>[
                  Expanded(child: Row(spacing: 4, children: leading)),
                  Expanded(
                    child: Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: trailing,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              child: BooUIText(
                'BOO',
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _mainView({required PageController controller}) => PageView.builder(
    controller: controller,
    itemCount: _MainMenu.values.length,
    itemBuilder: (_, int i) => _MainMenu.values[i].page,
  );

  Widget _menuView({
    required _MainMenu selected,
    required Function(_MainMenu menu) onSelect,
  }) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: _MainMenu.values
          .map(
            (_MainMenu e) => Expanded(
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
                      color: selected == e
                          ? BooColor.get.turquoise1
                          : BooColor.get.text,
                    ),
                    BooUIText(
                      e.title,
                      color: selected == e
                          ? BooColor.get.turquoise1
                          : BooColor.get.text,
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
