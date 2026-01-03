import 'package:boo/cores/core/core.dart' show BooNavigationDelegate;

abstract class UniverseNavigationDelegate extends BooNavigationDelegate {
  const UniverseNavigationDelegate();

  void onNotification();
}
