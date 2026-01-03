import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/features/match/match.navigation.dart'
    show MatchNavigationDelegate;
import 'package:get/get.dart' show Get, GetNavigation;

class AppMatchNavigation extends MatchNavigationDelegate {
  const AppMatchNavigation();

  @override
  void onFilter() {
    Get.toNamed(AppRoute.dev.go);
  }
}
