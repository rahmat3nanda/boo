import 'package:boo/cores/core/core.dart' show BooNavigation, BooUIController;
import 'package:boo/features/match/match.navigation.dart'
    show MatchNavigationDelegate;
import 'package:boo/features/match/src/match.soul.page.dart' show MatchSoulPage;
import 'package:boo/features/match/src/power_up.sheet.dart' show PowerUpSheet;
import 'package:boo/shared/ui/colors/color.dart' show BooColor, BooColorBase;
import 'package:boo/shared/ui/widgets/widgets.dart'
    show BooScaffold, BooUIDev, BooUIInfiniteListView, BooUISvg, BooUIText;
import 'package:flutter/material.dart'
    show
        Container,
        Curves,
        EdgeInsets,
        FontWeight,
        GestureDetector,
        NeverScrollableScrollPhysics,
        PageController,
        PageView,
        SafeArea,
        SliverAppBar,
        SliverFillRemaining,
        StatelessWidget,
        TabBar,
        TabController,
        Widget;
import 'package:get/get.dart'
    show GetBuilder, GetSingleTickerProviderStateMixin, ObxValue, Rx;
import 'package:tab_indicator_styler/tab_indicator_styler.dart'
    show RectangularIndicator;

part 'src/match.controller.dart';
part 'src/match.menu.dart';

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
    builder: (_MatchController controller) => BooScaffold(
      body: SafeArea(
        bottom: false,
        child: ObxValue<Rx<_MatchMenu>>(
          (Rx<_MatchMenu> menu) => BooUIInfiniteListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            headers: <Widget>[
              _appBar(
                controller: controller.menuController,
                selected: menu.value,
                onChanged: controller.onMenuChanged,
              ),
            ],
            footers: <Widget>[
              SliverFillRemaining(
                child: PageView.builder(
                  itemCount: _MatchMenu.values.length,
                  controller: controller.menuPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) => _MatchMenu.values[index].view,
                ),
              ),
            ],
            children: const <Widget>[],
          ),
          controller.menu,
        ),
      ),
    ),
  );

  SliverAppBar _appBar({
    required TabController controller,
    required _MatchMenu selected,
    required Function(int index) onChanged,
  }) => SliverAppBar(
    floating: true,
    snap: true,
    bottom: TabBar(
      controller: controller,
      onTap: onChanged,
      tabs: _MatchMenu.values
          .map(
            (_MatchMenu e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: BooUIText(
                e.title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: e == selected
                    ? BooColor.get.scaffold
                    : BooColor.get.text,
              ),
            ),
          )
          .toList(),
      dividerHeight: 0,
      indicator: RectangularIndicator(
        topLeftRadius: 24,
        topRightRadius: 24,
        bottomLeftRadius: 24,
        bottomRightRadius: 24,
        color: selected.color.value,
      ),
    ),
  );
}
