import 'package:boo/cores/core/core.dart' show BooRoute;

enum AppRoute with BooRoute {
  main('/');

  const AppRoute(this.go);

  @override
  final String go;
}
