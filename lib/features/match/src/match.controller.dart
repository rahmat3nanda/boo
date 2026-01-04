part of '../match.page.dart';

class _MatchController extends BooUIController
    with GetSingleTickerProviderStateMixin {
  late final TabController menuController = TabController(
    length: _MatchMenu.values.length,
    vsync: this,
  );
  final PageController menuPageController = PageController();

  final Rx<_MatchMenu> menu = Rx<_MatchMenu>(_MatchMenu.values.first);

  @override
  void onClose() {
    menuController.dispose();
    super.onClose();
  }

  void onMenuChanged(int index) {
    menu.value = _MatchMenu.values[index];
    menuPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
