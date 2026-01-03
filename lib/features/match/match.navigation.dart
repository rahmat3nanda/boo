import 'package:boo/cores/core/core.dart' show BooNavigationDelegate;

abstract class MatchNavigationDelegate extends BooNavigationDelegate {
  const MatchNavigationDelegate();

  void onFilter();
}
