import 'package:boo/cores/core/core.dart' show BooNavigationDelegate;

abstract class MessageNavigationDelegate extends BooNavigationDelegate {
  const MessageNavigationDelegate();

  void onCreateNew();
}
