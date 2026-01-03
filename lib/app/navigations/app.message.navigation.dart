import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/features/message/message.navigation.dart'
    show MessageNavigationDelegate;
import 'package:get/get.dart' show Get, GetNavigation;

class AppMessageNavigation extends MessageNavigationDelegate {
  const AppMessageNavigation();

  @override
  void onCreateNew() {
    Get.toNamed(AppRoute.dev.go);
  }
}
