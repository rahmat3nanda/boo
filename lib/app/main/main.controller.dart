part of 'main.page.dart';

class _MainController extends BooUIController {
  final PageController menuController = PageController();
  final Rx<_MainMenu> menu = Rx<_MainMenu>(_MainMenu.values.first);

  @override
  void onClose() {
    menuController.dispose();
    super.onClose();
  }

  void onDrawerTapped() {
    BooToast.success(title: 'Under development');
  }

  void onMenuSelected(_MainMenu item) {
    if (item == _MainMenu.create) {
      Get.toNamed(AppRoute.dev.go);
      return;
    }
    menu.value = item;
    menuController.jumpToPage(item.index);
  }
}
