import 'package:boo/app/main/main.page.dart' show MainPage;
import 'package:boo/cores/core/core.dart' show BooCore;
import 'package:boo/shared/ui/themes/theme.dart' show BooTheme;
import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        Widget;

class App extends StatelessWidget {
  const App({super.key});

  static Future<void> initialize() async {
    // Cores
    await BooCore.initialize();

    // Shared's
    BooTheme.initialize();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MainPage(),
  );
}
