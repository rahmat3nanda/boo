import 'package:boo/cores/core/core.dart' show BooRoute;

enum AppRoute with BooRoute {
  main('/'),
  dev('/dev');

  const AppRoute(this.go);

  @override
  final String go;

  static BooRoute get initial => AppRoute.main;
}
