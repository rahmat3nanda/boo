import 'package:boo/cores/core/core.dart' show BooRoute, BooService;
import 'package:get/get.dart' show Get, GetNavigation, Inst;

abstract class BooNavigationDelegate {
  const BooNavigationDelegate();
}

enum NavigationPrefer {
  toNamed,
  offNamed;

  Future<T?>? call<T>(BooRoute route, {dynamic arguments}) => switch (this) {
    toNamed => Get.toNamed(route.go, arguments: arguments),
    offNamed => Get.offNamed(route.go, arguments: arguments),
  };
}

class BooNavigation extends BooService {
  final List<BooNavigationDelegate> _delegates = <BooNavigationDelegate>[];

  static BooNavigation get i => Get.find<BooNavigation>();

  static void initialize(List<BooNavigationDelegate> delegates) {
    final BooNavigation service = Get.put(BooNavigation());
    service._delegates.addAll(delegates);
  }

  T delegate<T extends BooNavigationDelegate>() {
    final List<BooNavigationDelegate> results = _delegates
        .whereType<T>()
        .toList();
    if (results.isEmpty) {
      throw Exception('Delegate of type ${T.runtimeType} not found');
    }
    if (results.length > 1) {
      throw Exception('Multiple delegates of type ${T.runtimeType} found');
    }

    return results.first as T;
  }
}
