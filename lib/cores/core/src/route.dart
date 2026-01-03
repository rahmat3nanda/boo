abstract mixin class BooRoute {
  String get go;

  String get placeholder => ':id';

  String resolve(String? value) =>
      value == null ? go : go.replaceAll(placeholder, value);
}
