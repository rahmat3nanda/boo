part of '../match.page.dart';

class _MatchController extends BooUIController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: _MatchMenu.values.length,
    vsync: this,
  );

  final Rx<_MatchMenu> menu = Rx<_MatchMenu>(_MatchMenu.values.first);

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void onMenuChanged(int index) {
    menu.value = _MatchMenu.values[index];
  }
}
