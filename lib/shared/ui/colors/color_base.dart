part of 'color.dart';

typedef BooColorsBase = List<BooColorBase>;

class BooColorBase {
  const BooColorBase(this.value);

  final Color value;
}

extension _ColorBoowColorBase on Color {
  BooColorBase get base => BooColorBase(this);
}

extension BoowColorToolBase on BooColorBase {
  BooColorBase withOpacity(double opacity) =>
      BooColorBase(value.withValues(alpha: opacity));

  BooColorsBase toColors({int length = 2}) =>
      List<BooColorBase>.generate(length, (_) => this);
}

extension BooColorsToolBase on BooColorsBase {
  List<Color> get values => map((BooColorBase e) => e.value).toList();

  BooColorsBase withOpacity(double opacity) =>
      map((BooColorBase e) => e.withOpacity(opacity)).toList();

  LinearGradient gradient({
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) => LinearGradient(begin: begin, end: end, colors: values);
}
