import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/features/universe/universe.navigation.dart'
    show UniverseNavigationDelegate;
import 'package:get/get.dart' show Get, GetNavigation;

class AppUniverseNavigation extends UniverseNavigationDelegate {
  const AppUniverseNavigation();

  @override
  void onNotification() {
    Get.toNamed(AppRoute.dev.go);
  }
}
