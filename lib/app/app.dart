import 'dart:async' show unawaited;

import 'package:boo/app/app.pages.dart' show AppPages;
import 'package:boo/app/app.routes.dart' show AppRoute;
import 'package:boo/cores/core/core.dart' show BooCore, BooLogger;
import 'package:boo/shared/ui/extensions/system_overlay.dart'
    show BooSystemOverlayBrightness;
import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:boo/shared/ui/themes/theme_data.dart' show booThemeData;
import 'package:boo/shared/ui/themes/theme_mode_enum.dart'
    show BooThemeModeTools;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart'
    show
        AnnotatedRegion,
        ColoredBox,
        Colors,
        ErrorWidget,
        StatelessWidget,
        Widget,
        WidgetsFlutterBinding;
import 'package:flutter/services.dart'
    show DeviceOrientation, SystemChrome, SystemUiOverlayStyle;
import 'package:get/get.dart' show GetBuilder, GetMaterialApp, Transition;

class App extends StatelessWidget {
  const App({super.key});

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (kReleaseMode) {
      ErrorWidget.builder = (_) => const ColoredBox(color: Colors.transparent);
    }
    unawaited(
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    );

    // Cores
    await BooCore.initialize();

    // Shared's
    BooTheme.initialize();
  }

  static Future<void> onReady() async {}

  @override
  Widget build(_) => GetBuilder<BooTheme>(
    builder: (BooTheme theme) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: theme.mode.value.overlay.iconBrightness,
        statusBarBrightness: theme.mode.value.overlay.brightness,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            theme.mode.value.overlay.iconBrightness,
      ),
      child: GetMaterialApp(
        defaultTransition: Transition.circularReveal,
        debugShowCheckedModeBanner: false,
        title: 'Boo',
        initialRoute: AppRoute.initial.go,
        // translations: BooLanguage.i.data.value,
        // navigatorObservers: <NavigatorObserver>[MuNavigatorObserver()],
        // fallbackLocale: BooLanguage.localeList.first,
        // locale: BooLanguage.i.language.value?.locale,
        theme: booThemeData(theme),
        getPages: AppPages.list,
        onReady: onReady,
        logWriterCallback: (String? message, {bool isError = false}) =>
            BooLogger.i.add('${isError ? '[Error]' : ''} $message'),
      ),
    ),
  );
}
