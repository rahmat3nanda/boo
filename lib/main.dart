import 'dart:async' show runZonedGuarded;

import 'package:boo/app/app.dart' show App;
import 'package:boo/cores/logger.dart' show BooLogger;
import 'package:flutter/material.dart' show debugPrint, runApp;

void main() {
  runZonedGuarded(
    () {
      runApp(const App());
    },
    (Object exception, StackTrace stackTrace) {
      try {
        BooLogger.i.error('$exception\n$stackTrace');
      } catch (_) {
        debugPrint('$exception\n$stackTrace');
      }
    },
  );
}
