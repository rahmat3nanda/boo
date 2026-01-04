import 'dart:ui' show Brightness;

enum BooSystemOverlay { dark, light }

extension BooSystemOverlayBrightness on BooSystemOverlay {
  Brightness get iconBrightness => switch (this) {
    BooSystemOverlay.dark => Brightness.dark,
    BooSystemOverlay.light => Brightness.light,
  };

  Brightness get brightness => switch (this) {
    BooSystemOverlay.dark => Brightness.dark,
    BooSystemOverlay.light => Brightness.light,
  };
}
